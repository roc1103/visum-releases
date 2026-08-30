# Install or locate Visum CLI

## Requirements

The current public CLI supports Apple Silicon Macs running macOS 14 or later. Intel Mac support is deferred.

First check for an existing installation:

```sh
command -v visum
visum --version
visum doctor --json
```

If `visum` is absent, explain that the AI Skill is an instruction layer and requires the separate local CLI. Obtain explicit authorisation to install it. The user—not the agent—must review and accept the Visum Software Licence and RO-ER Model Licence.

The skill includes a pinned installer for the public `0.1.2` Alpha release:

```sh
./scripts/install_cli.sh --accept-licences
```

Only pass `--accept-licences` after the user explicitly confirms acceptance. The installer:

- downloads the official GitHub release asset;
- verifies its pinned SHA-256 digest;
- installs the complete self-contained CLI under the user's Library;
- links `visum` into `~/.local/bin`;
- adds the bundled official models to Visum's shared model library; and
- runs `visum doctor --json`.

If `~/.local/bin` is not on `PATH`, report the command printed by the installer. Do not edit shell startup files unless the user requests it.

For testing with an already downloaded official archive, use:

```sh
./scripts/install_cli.sh --accept-licences --archive /path/to/Visum-CLI-0.1.2.zip
```

Managed or isolated environments may set `VISUM_CLI_INSTALL_PARENT` and `VISUM_CLI_BIN_DIR`. `--skip-model-import` installs the executable and runtime without copying the bundled models into the shared library.

Do not bypass a checksum failure, architecture failure, existing-file conflict, or failed `visum doctor` check. Do not replace a non-symlink executable already named `visum`.

Public release page: <https://github.com/roc1103/visum-releases/releases/tag/v0.1.2>

Direct CLI archive: <https://github.com/roc1103/visum-releases/releases/download/v0.1.2/Visum-CLI-0.1.2.zip>

After installation, Visum's signed update manifests become authoritative. Run `visum update check all --json`; do not assume this bootstrap document remains the latest release forever.
