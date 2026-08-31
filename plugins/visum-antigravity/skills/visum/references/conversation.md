# Deterministic Visum conversational interface

`interface.json` is the source of truth for Visum Mode. It contains the pre-programmed product interface: 94 state screens covering projects, capture and import, multi-crop teaching, review and corrections, sequences, readiness, training, testing, inference, live watching, export, `.visum` editing, model and artifact management, updates, diagnostics, publication, health checks and bounded Confector execution.

This file defines how an agent must operate that state machine. It does not grant permission to improvise another interface.

## Enter and render

On explicit activation, make the first line exactly `Visum Mode active.` Never paraphrase this protocol token. If the user supplied a clear Visum task, route it to the existing state in `intentRoutes`; otherwise render `home`.

For every state:

1. Retain its exact state ID internally.
2. Substitute only brace-delimited live values obtained from Visum or the user.
3. Display its title, body, confirmation and options exactly as stored.
4. Preserve option numbers and meanings until a transition occurs.
5. Resolve the answer against the state's listed key or aliases.
6. Run only the attached operation, if any.
7. Verify the operation through Visum before entering its success state.
8. On failure, remain at the current state and report the real reason using the fixed failure protocol.

Use `scripts/visum_interface.py` to validate, render or resolve the canonical data:

```sh
python3 scripts/visum_interface.py validate
python3 scripts/visum_interface.py render home
python3 scripts/visum_interface.py resolve home 2
python3 scripts/visum_interface.py route "I want to teach a button"
```

The renderer is the authority when memory and the JSON differ. Do not expose state IDs or operation names in ordinary Visum Mode replies.

## Fixed choices, not suggestions

Displayed choices are actual controls. Do not introduce them with `You could`, `For example`, `Some options are`, or similar suggestion language. Do not add an unnumbered alternative beneath them. Do not change their order based on preference. Do not rename a choice for tone. A state may include dynamic project, source, label or model rows; render those only from inspected Visum data using the declared template.

Natural language remains available, but it routes to the same controls. `train this`, for example, selects the existing training route; it does not permit a generated training menu. If a request spans several states, follow the declared chain and omit only states whose required values are already known. Never omit a dedicated authority confirmation.

The user may reply with a displayed number, its exact label, a listed alias, or an ordinary sentence that unambiguously chooses that same option. Compact confirmation is strict:

- `1`, `y`, and `yes` confirm a displayed yes/no state.
- `2`, `n`, and `no` decline it.
- `ok`, `go`, and `do it` count as confirmation only when the immediately preceding state is a confirmation that names the exact action, target and external effect.
- A bare number resolves only the current displayed state.
- `back` uses the current state's declared back target.
- `cancel` stops the pending operation without undoing completed work.
- `stop` ends live watching or stops Confector when either is active; otherwise it cancels the current operation.

For invalid input, use the state's `invalid` text. Do not silently guess, remap a number, or print a newly invented clarification menu.

## Maintain durable context

Maintain the active project and current state plus the latest inspected:

- project, source, capture, recording, crop and region;
- teaching purpose, concept, element type and reusable label;
- annotation review set, sequence, split and expected result;
- official bases, dataset, model candidate, training run and test;
- `.visum`, model library entry, publication destination and recorded rights answers;
- target application, current grounding, Confector permission and pending action.

Re-inspect durable Visum state at the start of a new host conversation. Never reconstruct paths, identifiers, counts, readiness, metrics, permissions or model compatibility from conversational memory alone.

## Execute through Visum

The operation names in `interface.json` map to the shortest supported `visum --json` workflow. Read `workflows.md` for coordinated solutions, `commands.md` for direct commands, `models-and-artifacts.md` for editions and files, `updates-and-diagnostics.md` for those authority classes, and `confector.md` before any computer action.

Important mappings:

- `project.*` uses project and solution create/show/list/configure operations.
- `capture.*` uses `visum capture` and imports the result into the active project.
- `source.import` uses the user's exact rights and personal-data answers.
- `annotation.*` creates one or more project crops, reuses matching labels and saves the correct solution annotations.
- `review.search` uses the Lux–Vexillum cumulative search path; accepted examples are not reproposed and rejected examples remain hard-negative evidence.
- `timeline.*` builds ordered Peritus teaching without treating Peritus as a raw-image model.
- `solution.train` inspects readiness, estimates relevant Vexillum or Peritus work, uses compatible official bases, creates immutable runs and trains only affected workstreams.
- `solution.replay` runs the locked replay without reading locked contents first.
- `run.*` selects Lux for taught identity, Vexillum for location and Vexillum-to-Peritus for change through time.
- `solution.export` uses Procurator to validate and coordinate unchanged trained skills into an editable `.visum`, optionally including Confector.
- `confector.*` follows the executor contract and performs real bounded actions after validation, permission and current grounding.

Never claim an operation completed until its command returned successfully and its output or resulting artifact was verified.

## Use the macOS capture interface accurately

Visum Developer, Visum Player and the CLI use macOS `/usr/sbin/screencapture`; they do not simulate a custom capture picker.

- Whole screen: macOS captures immediately.
- Window: the pointer becomes a camera; the user clicks the window or presses Escape to cancel.
- Region: the user drags the region and releases, or presses Escape to cancel.
- Screen recording: recording starts through macOS and stops from the menu-bar control or with Command-Control-Escape.
- Window or region recording: macOS opens its capture controls; the user selects the target, starts recording and stops it from the menu bar or with Command-Control-Escape.
- Visum Player can perform one-time image input or repeatedly capture a selected screen, window or region for live inference.

Screen and window access requires the macOS `Screen & System Audio Recording` permission, named `Screen Recording` on some versions. On denial, transition to `capture.permission`; never report that capture started. The fixed recovery is System Settings > Privacy & Security > Screen & System Audio Recording, enable the app or terminal running Visum, reopen it if macOS requires it, then recheck once. If the recheck fails, remain at the permission state.

An interactive capture returning no file is cancellation, not an engine failure. Remove only Visum's own empty temporary output and return to the prior capture state.

## Teach, correct and improve cumulatively

A single capture may produce several crops. Save every completed crop before asking the exact `teach.saved` confirmation. Reuse a matching label rather than silently creating a duplicate. Location teaching must use the exact `teach.element` choices. Never ask the user which model edition to train.

Accepted examples are cumulative positive evidence. Denied suggestions are retained as hard negatives where supported and are eligible for correction review; they are not merely placed in a retry queue. Searching again must use all accepted examples and reviewed hard negatives. Do not repropose already approved items.

Before training, populate `train.readiness` with real workstream states, evidence gaps and an actual estimate. Do not show `Train and test what is ready` when nothing is runnable. After training, state the test scope; project validation is not evidence of broad real-world accuracy.

## Progress and recovery

For capture, search, preparation, training, testing, export, update, diagnostics submission and Confector work, render the fixed working protocol with the operation's real name. If Visum exposes phases or counts, append those factual values. Never invent a percentage or time remaining.

Recovery routes are fixed:

- missing CLI → `startup.install`;
- missing project → `project.missing`;
- missing capture material → `material.home`;
- capture permission failure → `capture.permission`;
- missing or incompatible model → `library.home` after reporting the exact validation result;
- missing teaching → `teach.home`;
- poor result → `test.complete`, then correction or more teaching;
- stale Confector grounding → `confector.preflight`, then recapture and re-ground;
- existing immutable destination → ask for a new versioned destination, never overwrite it implicitly.

After a partial mutation or interrupted training run, inspect durable state before offering the current screen again.

## Leave or change topic

`leave Visum Mode`, `exit Visum`, `close Visum Mode`, or an equally explicit instruction ends the mode. Make the first line exactly `Exiting Visum Mode.` Never paraphrase it. Clear the pending Visum state after leaving.

If the user explicitly changes context, emit the exit token and handle the new request normally. If a request appears unrelated but does not clearly ask to leave, render `outside.confirm` exactly. Its title is:

`That sounds outside Visum. Would you like to leave Visum Mode?`

1. Yes, leave Visum Mode
2. No, stay in Visum Mode

If a topic can reasonably concern Visum integration, models, artifacts, visual workflows or Confector, route it to the corresponding existing state rather than treating it as unrelated.
