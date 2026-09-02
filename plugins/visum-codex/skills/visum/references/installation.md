# Install or locate Visum CLI

## Requirements

The current public CLI supports Apple Silicon Macs running macOS 14 or later. Intel Mac support is deferred.

First check for an existing installation:

```sh
command -v visum
visum --version
visum doctor --json
```

If `visum` is absent, explain that the AI Skill is an instruction layer and requires the separate local CLI. Obtain explicit authorisation to install it. The actual licensee—not the agent, administrator, installer, device owner, or person preparing a computer for somebody else—must review and accept the Visum Software Licence and RO-ER Model Licence. If that person is absent, stop before acceptance and do not provide an acceptance command as a workaround.

The skill includes a pinned installer for the public `0.1.10` Alpha release:

```sh
./scripts/install_cli.sh --accept-licences
```

Only pass `--accept-licences` after the actual licensee explicitly confirms acceptance in the current conversation. Do not infer acceptance from an earlier request to install, an administrator role, device ownership, or a request to prepare the computer for another person. The installer:

- downloads the official GitHub release asset;
- verifies its pinned SHA-256 digest;
- installs the complete self-contained CLI under the user's Library;
- links `visum` into `~/.local/bin`;
- adds the bundled official models to Visum's shared model library; and
- runs `visum doctor --json`.

If `~/.local/bin` is not on `PATH`, report the command printed by the installer. Do not edit shell startup files unless the user requests it.

For testing with an already downloaded official archive, use:

```sh
./scripts/install_cli.sh --accept-licences --archive /path/to/Visum-CLI-0.1.10.zip
```

Managed or isolated environments may set `VISUM_CLI_INSTALL_PARENT` and `VISUM_CLI_BIN_DIR`. `--skip-model-import` installs the executable and runtime without copying the bundled models into the shared library.

Do not bypass a checksum failure, architecture failure, existing-file conflict, or failed `visum doctor` check. Do not replace a non-symlink executable already named `visum`.

Public release page: <https://github.com/roc1103/visum-releases/releases/tag/v0.1.10>

Direct CLI archive: <https://github.com/roc1103/visum-releases/releases/download/v0.1.10/Visum-CLI-0.1.10.zip>

After installation, Visum's signed update manifests become authoritative. Run `visum update check all --json`; do not assume this bootstrap document remains the latest release forever.
