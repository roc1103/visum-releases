# Guided workflows

## Start a complete project

Create one project, then configure the purposes implied by the user's outcome. A project may contain all three purposes.

```sh
visum project create Project.visumproject --name "Project" --edition lux --storage managed-copy --json
visum solution configure Project.visumproject --purposes recognise,locate,follow --json
```

Use `recognise` for taught identity, `recognise,locate` when the item must be found in a larger interface, and all three when visual changes must be followed. Do not expose edition selection unless the user explicitly asks for the underlying model details.

People may instead run `visum` or `visum interactive` for the terminal menu. The menu is a front end to these same durable commands, not a separate workflow.

## Teach the solution

List sources and reusable labels before creating records:

```sh
visum project source list Project.visumproject --json
visum solution labels Project.visumproject --json
visum solution label-add Project.visumproject --group controls --value Save --json
```

One region may teach recognition and location together:

```sh
visum solution annotation-add Project.visumproject \
  --source SOURCE_ID --purpose recognise-locate --concept Save \
  --x 0.1 --y 0.1 --width 0.2 --height 0.2 \
  --element-type buttonOrControl --label LABEL_ID --json
```

Repeat `annotation-add` for every useful crop; one capture may contain many regions. Use `recognise`, `locate`, or `follow` when only one purpose applies. List and review proposed records with:

```sh
visum solution annotations Project.visumproject --json
visum solution annotation-review Project.visumproject \
  --annotation ANNOTATION_ID --state accepted --json
```

Use `--state rejected` for denials. Paired recognition/location records are reviewed together, and rejected examples remain useful hard-negative evidence.

## Teach a sequence

Create a bounded JSON array of ordered frames, each containing `sourceIdentifier`, optional `timeSeconds`, `stage`, `transition`, and optional `ignored`, then run:

```sh
visum solution timeline-add Project.visumproject \
  --name "Checkout flow" --split train --input frames.json --json
```

Use separate `train`, `validation`, and `locked-test` sequences. For a locked test, create a JSON object of expected field/value pairs and attach it without examining model output:

```sh
visum solution expected-set Project.visumproject \
  --timeline TIMELINE_ID --input expected.json --json
```

## Inspect an existing project

```sh
visum solution show Project.visumproject --json
visum solution labels Project.visumproject --json
visum solution annotations Project.visumproject --json
visum solution timelines Project.visumproject --json
visum project source list Project.visumproject --json
visum project crop list Project.visumproject --json
```

Summarise what the project has, which model roles it uses, and what is missing. Do not make the user choose a model merely because the CLI exposes edition-specific commands.

## Prepare a visual solution

```sh
visum solution prepare Project.visumproject --json
```

Preparation creates or refreshes the project-derived data required by the roles actually used. Inspect the returned paths and validation results before training.

## Train the solution

Discover compatible bases with `visum library list --json`, then run:

```sh
visum solution train Project.visumproject \
  --lux-base /path/to/official-lux.visumpack \
  --vexillum-base /path/to/official-vexillum.visumpack \
  --peritus-base /path/to/official-peritus.visumpack \
  --epochs 1 --batch-size 1 --json
```

Supply all three base options because the solution command requires them; the project determines which roles actually run. Never substitute an arbitrary or user-trained pack for an official base. If training is expected to be substantial, use the individual edition estimate commands before proceeding.

## Recheck after corrections

After the user adds, approves, denies, or corrects examples, rerun preparation and the affected training stage. Keep accepted examples in the cumulative teaching data. Denied items should remain hard negatives or corrected review data when the project records them; do not repeatedly send already approved results back through the denied-only review queue.

Use locked-test data only through the lifecycle commands. Never inspect it to tune the candidate.

## Replay a locked session

```sh
visum solution replay Project.visumproject \
  --lux-base /path/to/official-lux.visumpack --json
```

Report what the replay actually tested and any observed failures. Do not generalise beyond the recorded session.

## Export and run

Validate the resulting bundle and document before use:

```sh
visum bundle validate Solution.visumbundle --json
visum bundle test Solution.visumbundle --json
visum document validate Solution.visum --json
visum run visum Solution.visum screenshot.png --json
```

Use `visum document refresh` after editing embedded project material. Use `visum document replace` only when the user intends to replace the packaged project, bundle, and weight manifest while retaining the `.visum` path.
