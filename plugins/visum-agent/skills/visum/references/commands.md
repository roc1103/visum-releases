# Common CLI operations

Run `visum --help` for the exact command surface installed on the machine. Add `--json` for machine-readable output unless the command is inherently interactive or already returns JSON.

## Projects and capture

```sh
visum project create Project.visumproject --name "Project" --edition lux --json
visum solution configure Project.visumproject --purposes recognise,locate,follow --json
visum project list . --json
visum capture screen capture.png --project Project.visumproject --session session-1 --json
visum capture window capture.png --project Project.visumproject --session session-1 --json
visum capture region capture.png --project Project.visumproject --session session-1 --json
visum capture record-window recording.mov --duration 30 --project Project.visumproject --session session-1 --json
visum project source extract-frames Project.visumproject SOURCE_ID --maximum-frames 18 --json
```

Screen and window capture require macOS Screen Recording permission. Ask the user to grant it through System Settings if macOS denies access; do not repeatedly trigger the permission prompt.

## Import and teach

Import requires truthful rights and personal-data values:

```sh
visum project import Project.visumproject image.png \
  --rights owned --personal-data no --storage managed --json
visum project crop add Project.visumproject \
  --source SOURCE_ID --x 0.1 --y 0.1 --width 0.2 --height 0.2 --json
```

For a multi-model Visum Project, prefer the solution commands below. They write the same project state used by Visum Developer:

```sh
visum solution label-add Project.visumproject --group controls --value Save --json
visum solution annotation-add Project.visumproject \
  --source SOURCE_ID --purpose recognise-locate --concept Save \
  --x 0.1 --y 0.1 --width 0.2 --height 0.2 \
  --element-type buttonOrControl --label LABEL_ID --json
visum solution annotations Project.visumproject --json
visum solution annotation-review Project.visumproject \
  --annotation ANNOTATION_ID --state accepted --json
```

Valid purposes are `recognise`, `locate`, `follow`, and the paired shortcut `recognise-locate`. Valid element types are `areaOrMenu`, `buttonOrControl`, `text`, and `iconOrImage`. Add as many regions as the capture contains; never collapse a multi-item capture into one crop.

For a sequence, pass an ordered JSON frame array to `solution timeline-add`, then attach expected field/value JSON with `solution expected-set`. Use `visum solution timelines --json` to retrieve timeline identifiers.

Lux visual identity:

```sh
visum project lux label Project.visumproject \
  --crop CROP_ID --namespace controls --label Save --group save-buttons --json
visum project lux review Project.visumproject --crop CROP_ID --state accepted --json
```

Use `--disposition hard-negative` for a reviewed confusing non-match, not for an unreviewed item.

Vexillum element location:

```sh
visum project vexillum element-add Project.visumproject \
  --crop CROP_ID --type button --x 0.1 --y 0.1 --width 0.2 --height 0.2 \
  --labels save,primary --json
visum project vexillum review Project.visumproject --crop CROP_ID --state accepted --json
```

Peritus sequence:

```sh
visum project peritus session-add Project.visumproject \
  --input current-session.json --split train --json
```

## Dataset lifecycle

```sh
visum dataset build Training.visumset --project Project.visumproject \
  --id project-training --version 1.0.0 --split 80,10,10 \
  --isolation application-session --json
visum dataset validate Training.visumset --json
visum dataset inspect Training.visumset --json
visum dataset measure Training.visumset --json
```

Do not use `dataset build-fixture` for user work or publication evidence; it exists for engine regression tests.

## Lux

```sh
visum train lux-reference Training.visumset \
  --model OfficialLux.visumpack --output References.visumpack \
  --id project-references --version 1.0.0 --json
visum test lux-reference Training.visumset \
  --model OfficialLux.visumpack --pack References.visumpack --json
visum run lux image.png --model OfficialLux.visumpack \
  --pack References.visumpack --maximum-results 5 --json
```

Lux scores are cosine similarities, not calibrated probabilities.

## Vexillum and Peritus

Estimate before a substantial run:

```sh
visum train estimate vexillum Training.visumset \
  --base-model OfficialVexillum.visumpack --epochs 3 --batch-size 8 --json
visum train estimate peritus Training.visumset \
  --base-model OfficialPeritus.visumpack --epochs 3 --batch-size 8 --json
```

Then create an immutable candidate run with a new output pack and run directory. Inspect `visum --help` for the full options before composing the command. Use `visum train status --json`, `cancel`, or `recover` to manage it.

Inference:

```sh
visum run vexillum screenshot.png --model MODEL_OR_LIBRARY_ID --json
visum run peritus observations.json --model MODEL_OR_LIBRARY_ID --json
visum run pipeline frame-1.png frame-2.png \
  --vexillum-model VEXILLUM_MODEL --peritus-model PERITUS_MODEL \
  --frame-interval-ms 100 --json
```

## Library, bundles, and documents

```sh
visum library list --json
visum library add Model.visumpack --json
visum bundle assess --models IDENTITY_1,IDENTITY_2 --json
visum bundle validate Solution.visumbundle --json
visum bundle test Solution.visumbundle --json
visum bundle instructions Solution.visumbundle --json
visum bundle permissions Solution.visumbundle --json
visum document validate Solution.visum --json
visum run visum Solution.visum screenshot.png --json
```

Do not publish, upload, or redistribute an official untrained RO-ER model or Visum Engine. A trained user model may be distributed only under the applicable bundled terms and with required RO Company credit.

## Watching directories

```sh
visum watch lux /path/to/frames --model OfficialLux.visumpack \
  --pack References.visumpack --interval-ms 500 --iterations 0 --json
visum watch vexillum /path/to/frames --model MODEL_OR_LIBRARY_ID \
  --interval-ms 500 --iterations 0 --json
visum watch bundle Solution.visumbundle /path/to/frames \
  --interval-ms 500 --iterations 0 --json
```

An iteration count of `0` is unbounded. Use it only when the user asks to keep watching, and stop the process promptly when requested.
