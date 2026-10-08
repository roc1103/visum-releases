# Visum AI Integration

Visum AI Integration gives supported coding agents one guided Visum Mode for capture, teaching, training, testing, and authorised actions. Choose your host below for a quick installation path. The [full installation guide](docs/installation.md) covers other surfaces, verification, updates, and removal.

## What this installs

This repository installs agent instructions and host-specific plugin, skill, or extension wrappers. It does **not** install Visum Developer, Visum Player, Visum CLI, Visum Engine, or official base models. The integration does not transmit user content.

## Local runtime

Local Visum operations require the separate Visum CLI and Engine on Apple Silicon with macOS 14 or later. Cloud agents and other operating systems can use guided instructions, but cannot control a separate Mac through that installation.

## Start here

| Host | Quick-install route | Full instructions |
| --- | --- | --- |
| [Claude Code](#claude-code) | Desktop marketplace plugin | [Desktop, CLI, and cloud](docs/installation.md#claude-code) |
| [OpenAI Codex](#openai-codex) | Desktop marketplace plugin | [App, CLI, IDE, and cloud](docs/installation.md#openai-codex) |
| [Cursor](#cursor) | Global skill | [Local and remote](docs/installation.md#cursor) |
| [Google Antigravity](#google-antigravity) | Desktop skill | [Desktop and CLI](docs/installation.md#google-antigravity) |
| [GitHub Copilot](#github-copilot) | App marketplace plugin | [App, CLI, and cloud](docs/installation.md#github-copilot) |
| [Google Gemini CLI](#google-gemini-cli) | Git extension | [CLI](docs/installation.md#google-gemini-cli) |
| [Windsurf / Cascade](#windsurf--cascade) | Global skill | [Desktop](docs/installation.md#windsurf--cascade) |
| [Devin](#devin) | Repository skill | [Local, CLI, and cloud](docs/installation.md#devin) |
| [Cline](#cline) | Global skill | [IDE and CLI](docs/installation.md#cline) |
| [Kiro](#kiro) | IDE skill import | [IDE, CLI, and web](docs/installation.md#kiro) |
| [OpenCode](#opencode) | Global skill | [Local clients](docs/installation.md#opencode) |

<a id="verification-status-right-now"></a>
Direct-install routes exist for all eleven hosts; [dated validation and catalogue details](docs/installation.md#verification-status-right-now) distinguish those routes from live-host tests and public listings.

## Quick installation

Open a host below for its shortest supported route. Terminal commands belong in a normal Terminal. The guide covers other surfaces, verification, updates, and removal.

<a id="claude-code"></a>
<details>
<summary>Claude Code — Claude Desktop Cowork or local Code</summary>

1. In Claude Desktop, open **Cowork → Customize → Plugins**. For a local **Code** session, use **+ → Plugins** instead.
2. Choose **Add marketplace** and enter `roc1103/visum-releases`.
3. Install **Visum**, start a new Cowork or local Code session, then type `/visum:visum` or ask Claude to enter Visum Mode.

[CLI, cloud, verification, updates, and removal](docs/installation.md#claude-code). Ordinary Claude Chat requires the pending public-directory listing.

</details>

<a id="openai-codex"></a>
<details>
<summary>OpenAI Codex — desktop app</summary>

1. Start a new Codex task and enter `/plugins`.
2. Choose **Add Marketplace** and enter `roc1103/visum-releases`.
3. Install **Visum**, start a new task, then mention `$visum` or ask Codex to enter Visum Mode.

[CLI, IDE, cloud, verification, updates, and removal](docs/installation.md#openai-codex). The universal-directory listing is not yet available.

</details>

<a id="cursor"></a>
<details>
<summary>Cursor — desktop and local CLI</summary>

In a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh cursor
```

Reload Cursor, confirm `visum` under **Customize → Skills**, then use `/visum` or ask Cursor to enter Visum Mode. [Remote installation, verification, updates, and removal](docs/installation.md#cursor).

</details>

<a id="google-antigravity"></a>
<details>
<summary>Google Antigravity — 2.0 desktop</summary>

In a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh antigravity
```

Restart Antigravity 2.0 and ask it to enter Visum Mode. The `agy` CLI needs a separate plugin. [CLI installation, verification, updates, and removal](docs/installation.md#google-antigravity).

</details>

<a id="github-copilot"></a>
<details>
<summary>GitHub Copilot — app</summary>

1. Open **Customize → Plugins**.
2. Select the icon beside the marketplace dropdown and add a custom marketplace: `roc1103/visum-releases`.
3. Install `visum`, start a new session, then ask Copilot to enter Visum Mode.

[CLI, cloud, verification, updates, and removal](docs/installation.md#github-copilot).

</details>

<a id="google-gemini-cli"></a>
<details>
<summary>Google Gemini CLI — Git extension</summary>

In a normal Terminal:

```sh
gemini extensions install https://github.com/roc1103/visum-releases --ref main --auto-update
```

Restart Gemini CLI, run `/extensions list` to confirm Visum is loaded, then ask it to enter Visum Mode. [Verification, updates, and removal](docs/installation.md#google-gemini-cli).

</details>

<a id="windsurf--cascade"></a>
<details>
<summary>Windsurf / Cascade — desktop</summary>

In a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh windsurf
```

Reload Windsurf, confirm Visum under Cascade **Skills**, then type `@visum` or ask Cascade to enter Visum Mode. [Verification, updates, and removal](docs/installation.md#windsurf--cascade).

</details>

<a id="devin"></a>
<details>
<summary>Devin — repository skill</summary>

In a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh devin --project /absolute/path/to/repository
```

Replace `/absolute/path/to/repository` with the repository Devin will open. Commit and push `.agents/skills/visum`, then start a new Devin session and use `@skills:visum` or ask Devin to enter Visum Mode. [Verification, updates, and removal](docs/installation.md#devin).

</details>

<a id="cline"></a>
<details>
<summary>Cline — IDE and CLI</summary>

In a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh cline
```

Restart Cline, confirm `visum` in its Skills tab, then type `/visum` or ask Cline to enter Visum Mode. [Verification, updates, and removal](docs/installation.md#cline).

</details>

<a id="kiro"></a>
<details>
<summary>Kiro — IDE skill import</summary>

1. Open **Agent Steering & Skills** in the Kiro panel.
2. Choose **+ → Import a skill → GitHub**.
3. Enter `https://github.com/roc1103/visum-releases/tree/main/skills/visum`.
4. Import it, start a new session, type `/`, and choose `visum`.

[CLI, web, verification, updates, and removal](docs/installation.md#kiro).

</details>

<a id="opencode"></a>
<details>
<summary>OpenCode — local clients</summary>

In a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh opencode
```

Start a new OpenCode session and ask it to use the Visum skill or enter Visum Mode. [Verification, updates, and removal](docs/installation.md#opencode).

</details>

<a id="roo-code-legacy-only"></a>
<a id="behaviour-and-safety"></a>

## Licence and support

[Safety rules](docs/installation.md#behaviour-and-safety) and [legacy Roo instructions](docs/installation.md#roo-code-legacy-only) are in the full guide.

The [Apache License 2.0](LICENSE.txt) covers this AI integration and its wrappers. Visum Developer, Visum Player, Visum CLI, Visum Engine, and official base models have separate proprietary terms. Optional CLI diagnostics and example sharing are user-controlled; see the [legal and privacy notices](https://ai.rocompany.co.uk/legal).

[Signed downloads and release archives](https://github.com/roc1103/visum-releases/releases) · [Product information](https://ai.rocompany.co.uk/visum) · Support: `visum@rocompany.co.uk`
