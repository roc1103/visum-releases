#!/usr/bin/env python3
"""Render, resolve and validate Visum's deterministic conversational interface."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import re
import sys


INTERFACE = Path(__file__).resolve().parents[1] / "references" / "interface.json"


def load() -> dict:
    with INTERFACE.open(encoding="utf-8") as handle:
        return json.load(handle)


def referenced_targets(value: object, parent_key: str | None = None):
    if isinstance(value, dict):
        for key, child in value.items():
            if key in {"next", "success", "back"} and isinstance(child, str):
                yield child
            else:
                yield from referenced_targets(child, key)
    elif isinstance(value, list):
        for child in value:
            yield from referenced_targets(child, parent_key)


def referenced_actions(value: object):
    if isinstance(value, dict):
        for key, child in value.items():
            if key in {"action", "actionByContext"} and isinstance(child, str):
                yield child
            else:
                yield from referenced_actions(child)
    elif isinstance(value, list):
        for child in value:
            yield from referenced_actions(child)


def validate(data: dict) -> list[str]:
    errors: list[str] = []
    states = data.get("states")
    if not isinstance(states, dict) or not states:
        return ["states must be a non-empty object"]
    entry = data.get("entryState")
    if entry not in states:
        errors.append(f"entryState does not exist: {entry}")
    operations = data.get("operations")
    if not isinstance(operations, dict) or not operations:
        errors.append("operations must be a non-empty object")
        operations = {}

    for state_id, state in states.items():
        if not re.fullmatch(r"[a-z0-9.-]+", state_id):
            errors.append(f"invalid state id: {state_id}")
        if not isinstance(state.get("title"), str) or not state["title"].strip():
            errors.append(f"{state_id}: title is required")
        controls = [key for key in ("options", "dynamicOptions", "input", "confirm", "special") if key in state]
        if not controls and state_id not in {"run.watching"}:
            errors.append(f"{state_id}: no input control")
        options = state.get("options", []) + state.get("fixedOptions", [])
        keys: set[str] = set()
        aliases: set[str] = set()
        for option in options:
            key = str(option.get("key", "")).lower()
            if not key:
                errors.append(f"{state_id}: option missing key")
            if key in keys:
                errors.append(f"{state_id}: duplicate option key {key}")
            keys.add(key)
            if not str(option.get("label", "")).strip():
                errors.append(f"{state_id}: option {key} missing label")
            for alias in option.get("aliases", []):
                clean = str(alias).strip().lower()
                if clean in aliases or clean in keys:
                    errors.append(f"{state_id}: ambiguous alias {clean}")
                aliases.add(clean)
        for target in referenced_targets(state):
            if target not in states:
                errors.append(f"{state_id}: missing target state {target}")
        for action in referenced_actions(state):
            if action not in operations:
                errors.append(f"{state_id}: undeclared operation {action}")

    used_actions = set(referenced_actions(states))
    for action, operation in operations.items():
        if action not in used_actions:
            errors.append(f"unused declared operation {action}")
        if operation.get("handler") not in {
            "cli", "macos", "host-visual-selection", "state-only", "engine",
            "composed", "player-or-loop", "process", "host-file-save",
            "document", "authorised-external", "guided-recovery", "script",
        }:
            errors.append(f"{action}: invalid handler {operation.get('handler')}")
        if not str(operation.get("commandFamily", "")).strip():
            errors.append(f"{action}: commandFamily is required")
        if not str(operation.get("reference", "")).strip():
            errors.append(f"{action}: reference is required")

    for route in data.get("intentRoutes", []):
        if route.get("state") not in states:
            errors.append(f"intent route has missing state {route.get('state')}")

    required_fragments = {
        "material.home": ["Capture the whole screen", "Record a region", "Import existing images or videos"],
        "teach.home": ["Recognise this item", "Recognise and find this item on a screen", "changes matter"],
        "train.readiness": ["Train and test what is ready"],
        "run.home": ["Watch the screen, a window or a region"],
        "export.home": ["Confector for controlled computer actions"],
        "confector.home": ["Click", "Drag", "Type text", "Emergency stop"],
        "outside.confirm": ["Yes, leave Visum Mode", "No, stay in Visum Mode"],
    }
    for state_id, fragments in required_fragments.items():
        rendered = json.dumps(states.get(state_id, {}), ensure_ascii=False)
        for fragment in fragments:
            if fragment not in rendered:
                errors.append(f"{state_id}: missing required interface text {fragment!r}")

    all_text = json.dumps(data, ensure_ascii=False)
    for required in (".visumproject", ".visumset", ".visumpack", ".visum"):
        if required not in all_text:
            errors.append(f"missing public artifact type {required}")
    if ".visumbundle" in all_text:
        errors.append("internal .visumbundle extension leaked into interface")
    return errors


def substitute(text: str, values: dict[str, str]) -> str:
    return re.sub(r"\{([A-Za-z][A-Za-z0-9]*)\}", lambda match: values.get(match.group(1), match.group(0)), text)


def render(data: dict, state_id: str, values: dict[str, str]) -> str:
    state = data["states"].get(state_id)
    if state is None:
        raise KeyError(state_id)
    lines = [substitute(state["title"], values)]
    lines.extend(substitute(line, values) for line in state.get("body", []) if line)
    if state.get("confirmPrompt"):
        lines.append(substitute(state["confirmPrompt"], values))
    options = state.get("options", [])
    for option in options:
        lines.append(f"{option['key']}. {substitute(option['label'], values)}")
    if "confirm" in state:
        lines.extend(("1. Yes", "2. No"))
    if "input" in state:
        lines.append("Reply with the requested value, or reply back.")
    return "\n".join(lines)


def resolve(data: dict, state_id: str, reply: str) -> dict:
    state = data["states"].get(state_id)
    if state is None:
        return {"ok": False, "error": "unknownState", "state": state_id}
    clean = reply.strip().lower()
    if "confirm" in state:
        if clean in {"1", "y", "yes"}:
            return {"ok": True, "kind": "confirmation", **state["confirm"]["yes"]}
        if clean in {"2", "n", "no"}:
            return {"ok": True, "kind": "confirmation", **state["confirm"]["no"]}
        return {"ok": False, "error": state.get("invalid", "Answer y or n.")}
    for option in state.get("options", []) + state.get("fixedOptions", []):
        candidates = {str(option["key"]).lower(), *(str(value).lower() for value in option.get("aliases", []))}
        if clean in candidates:
            return {"ok": True, "kind": "option", **{key: value for key, value in option.items() if key != "aliases"}}
    if clean == "back" and state.get("back"):
        return {"ok": True, "kind": "transition", "next": state["back"]}
    if clean in {"exit", "quit", "leave visum mode", "exit visum"}:
        return {"ok": True, "kind": "exit", "token": data["protocol"]["exit"]}
    if "input" in state and clean:
        return {"ok": True, "kind": "input", "value": reply.strip(), **state["input"]}
    if clean in state.get("special", {}):
        return {"ok": True, "kind": "special", **state["special"][clean]}
    return {"ok": False, "error": state.get("invalid", data["protocol"]["invalid"])}


def route_intent(data: dict, text: str) -> dict:
    clean = " ".join(text.lower().split())
    matches = []
    for route in data.get("intentRoutes", []):
        for intent in route["intents"]:
            if intent in clean:
                matches.append((len(intent), intent, route["state"]))
    if not matches:
        return {"ok": False, "state": data["entryState"]}
    matches.sort(reverse=True)
    return {"ok": True, "intent": matches[0][1], "state": matches[0][2]}


def parse_values(raw_values: list[str]) -> dict[str, str]:
    values: dict[str, str] = {}
    for raw in raw_values:
        if "=" not in raw:
            raise ValueError(f"invalid value {raw!r}; expected name=value")
        key, value = raw.split("=", 1)
        values[key] = value
    return values


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    subparsers = parser.add_subparsers(dest="command", required=True)
    subparsers.add_parser("validate")
    render_parser = subparsers.add_parser("render")
    render_parser.add_argument("state")
    render_parser.add_argument("--value", action="append", default=[])
    resolve_parser = subparsers.add_parser("resolve")
    resolve_parser.add_argument("state")
    resolve_parser.add_argument("reply")
    route_parser = subparsers.add_parser("route")
    route_parser.add_argument("text")
    args = parser.parse_args()
    data = load()

    if args.command == "validate":
        errors = validate(data)
        if errors:
            for error in errors:
                print(error, file=sys.stderr)
            return 1
        print(f"Valid Visum interface {data['interfaceVersion']} · {len(data['states'])} states")
        return 0
    if args.command == "render":
        try:
            print(render(data, args.state, parse_values(args.value)))
        except KeyError:
            print(f"unknown state: {args.state}", file=sys.stderr)
            return 2
        except ValueError as error:
            print(error, file=sys.stderr)
            return 2
        return 0
    if args.command == "resolve":
        print(json.dumps(resolve(data, args.state, args.reply), ensure_ascii=False, sort_keys=True))
        return 0
    print(json.dumps(route_intent(data, args.text), ensure_ascii=False, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
