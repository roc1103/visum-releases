# Updates and diagnostics

## Updates

Read the current skill version from `VERSION`, then check the signed manifests for both executable and instruction updates:

```sh
VISUM_AI_SKILL_VERSION="$(tr -d '\n' < VERSION)" visum update check all --json
```

Do not install an update merely because one exists. Explain the available version and obtain the user's authorisation. Then update the CLI first:

```sh
visum update install cli --json
```

After that command succeeds, run `visum doctor --json`. The updater verifies the signed manifest and archive checksum, installs the new version atomically, redirects the `visum` command, performs the health check, and removes superseded CLI versions only after the check passes.

Refresh this installed skill with its bundled updater script:

```sh
./scripts/update.sh
```

The script installs the signed AI Skill update into this exact skill directory. Read the refreshed `SKILL.md` completely before continuing. A skill update changes instructions; it does not grant new authority for local or external actions.

## Anonymous diagnostics

Inspect the current choice:

```sh
visum diagnostics status --json
```

Enable or disable only after the user chooses:

```sh
visum diagnostics enable --json
visum diagnostics disable --json
```

Anonymous diagnostics contain only approved structured fields such as product and model versions, command group, timing, error code, item count, coarse macOS version and whether an operation succeeded. They never contain files, captures, paths, filenames, labels, prompts or typed text. Failure to send diagnostics must never block local Visum work.

## Explicit visual-example sharing

Submitting a corrected example is separate from anonymous diagnostics. Before running it, tell the user exactly which selected files will be uploaded and obtain confirmation that they have the right to share them with RO Company for Visum evaluation and model improvement.

```sh
visum diagnostics submit-example selected.png \
  --models lux,vexillum \
  --result incorrect \
  --correction "The Capture button should have been selected." \
  --rights-confirmed \
  --json
```

Never infer `--rights-confirmed`, select additional files, or submit a whole project when the user chose a bounded example.
