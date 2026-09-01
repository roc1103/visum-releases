#!/usr/bin/env python3
"""Behavioural contract tests for Visum's deterministic agent interface."""

from __future__ import annotations

import importlib.util
import json
from pathlib import Path
import unittest


ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "skills/visum/scripts/visum_interface.py"
SPEC = ROOT / "skills/visum/references/interface.json"

spec = importlib.util.spec_from_file_location("visum_interface", SCRIPT)
assert spec and spec.loader
interface = importlib.util.module_from_spec(spec)
spec.loader.exec_module(interface)


class InterfaceContractTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.data = json.loads(SPEC.read_text(encoding="utf-8"))

    def test_schema_and_graph_are_valid(self) -> None:
        self.assertEqual(interface.validate(self.data), [])
        self.assertGreaterEqual(len(self.data["states"]), 90)

    def test_home_is_exact_and_not_suggestive(self) -> None:
        self.assertEqual(
            interface.render(self.data, "home", {}),
            "\n".join(
                (
                    "What would you like to do?",
                    "1. Start or open a project",
                    "2. Teach Visum",
                    "3. Train or test",
                    "4. Run a Visum",
                    "5. More Visum tools",
                )
            ),
        )
        serialized = json.dumps(self.data["states"], ensure_ascii=False)
        for prohibited in ("You could", "For example", "Some options are"):
            self.assertNotIn(prohibited, serialized)

    def test_every_static_choice_resolves_without_remapping(self) -> None:
        for state_id, state in self.data["states"].items():
            for option in state.get("options", []) + state.get("fixedOptions", []):
                with self.subTest(state=state_id, key=option["key"]):
                    result = interface.resolve(self.data, state_id, str(option["key"]))
                    self.assertTrue(result["ok"])
                    self.assertEqual(str(result["key"]), str(option["key"]))
                for alias in option.get("aliases", []):
                    with self.subTest(state=state_id, alias=alias):
                        result = interface.resolve(self.data, state_id, alias)
                        self.assertTrue(result["ok"])
                        self.assertEqual(str(result["key"]), str(option["key"]))

    def test_confirmations_are_strict(self) -> None:
        for state_id, state in self.data["states"].items():
            if "confirm" not in state:
                continue
            with self.subTest(state=state_id):
                self.assertTrue(interface.resolve(self.data, state_id, "y")["ok"])
                self.assertTrue(interface.resolve(self.data, state_id, "1")["ok"])
                self.assertTrue(interface.resolve(self.data, state_id, "n")["ok"])
                self.assertTrue(interface.resolve(self.data, state_id, "2")["ok"])
                self.assertFalse(interface.resolve(self.data, state_id, "ok")["ok"])

    def test_natural_language_routes_to_existing_states_only(self) -> None:
        expectations = {
            "please create a new project": "project.new.name",
            "record region for this project": "material.home",
            "teach this button": "teach.home",
            "train it": "train.readiness",
            "run my exported model": "run.home",
            "check updates": "updates.home",
            "click the grounded control": "confector.home",
        }
        for text, state in expectations.items():
            with self.subTest(text=text):
                result = interface.route_intent(self.data, text)
                self.assertTrue(result["ok"])
                self.assertEqual(result["state"], state)

    def test_mac_capture_contract_is_complete(self) -> None:
        capture = self.data["capture"]
        self.assertEqual(capture["backend"], "/usr/sbin/screencapture")
        self.assertIn("Screen & System Audio Recording", capture["permission"])
        self.assertIn("camera", capture["still"]["window"])
        self.assertIn("Drag", capture["still"]["region"])
        for mode in ("screen", "window", "region"):
            self.assertIn("Command-Control-Escape", capture["recording"][mode])

    def test_all_public_artifacts_and_product_workflows_are_covered(self) -> None:
        serialized = json.dumps(self.data, ensure_ascii=False)
        for artifact in (".visumproject", ".visumset", ".visumpack", ".visum"):
            self.assertIn(artifact, serialized)
        self.assertNotIn(".visumbundle", serialized)
        for phrase in (
            "Recognise this item",
            "Recognise and find this item on a screen",
            "Mark something whose changes matter",
            "Train and test what is ready",
            "Watch the screen, a window or a region",
            "Procurator",
            "Confector executes bounded computer actions",
            "Publish a trained .visum",
        ):
            self.assertIn(phrase, serialized)

    def test_authority_boundaries_have_dedicated_confirmation_states(self) -> None:
        for state_id in (
            "startup.install-confirm",
            "updates.confirm",
            "diagnostics.enable",
            "diagnostics.flush",
            "diagnostics.example-confirm",
            "publish.confirm",
            "confector.confirm",
        ):
            with self.subTest(state=state_id):
                self.assertIn("confirm", self.data["states"][state_id])

    def test_public_install_guide_is_surface_specific_and_self_contained(self) -> None:
        readme = (ROOT / "README.md").read_text(encoding="utf-8")
        headings = (
            "Claude Code",
            "OpenAI Codex",
            "Cursor",
            "Google Antigravity",
            "GitHub Copilot",
            "Google Gemini CLI",
            "Windsurf / Cascade",
            "Devin",
            "Cline",
            "Kiro",
            "OpenCode",
        )
        self.assertEqual(readme.count("**Ready now:**"), len(headings))
        self.assertEqual(
            readme.count("| Surface | Works now? | What to install |"),
            len(headings),
        )
        self.assertGreaterEqual(readme.count("**Check it worked:**"), len(headings))
        for index, heading in enumerate(headings):
            start = readme.index(f"## {heading}")
            if index + 1 < len(headings):
                end = readme.index(f"## {headings[index + 1]}", start)
            else:
                end = readme.index("## Roo Code (legacy only)", start)
            section = readme[start:end]
            with self.subTest(host=heading):
                self.assertIn("| Surface | Works now? | What to install |", section)
                self.assertIn("**Check it worked:**", section)
                self.assertIn("Official reference", section)

        self.assertIn("Claude Desktop, **Cowork**", readme)
        self.assertIn("Claude remote/cloud Code session", readme)
        self.assertIn("Codex IDE extension", readme)
        self.assertIn("discovered skills are enabled by default", readme)
        self.assertIn("Kiro mobile does not currently install Powers", readme)


if __name__ == "__main__":
    unittest.main()
