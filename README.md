# Visum AI Integration

Visum AI Integration gives supported coding agents one guided Visum Mode for capture, teaching, training, testing, and authorised actions. Install the integration for the agent you use; [the full installation guide](docs/installation.md) has commands, verification steps, updates, and removal instructions for every host.

## What this installs

This repository installs agent instructions and host-specific plugin, skill, or extension wrappers. It does **not** install Visum Developer, Visum Player, Visum CLI, Visum Engine, or official base models. The integration does not transmit user content.

## Local runtime

Local Visum operations require the separate Visum CLI and Engine on Apple Silicon with macOS 14 or later. Cloud agents and other operating systems can use guided instructions, but cannot control a separate Mac through that installation.

## Start here

| Host | Direct route | Full instructions |
| --- | --- | --- |
| <a id="claude-code"></a>[Claude Code](docs/installation.md#claude-code) | Git marketplace plugin | [Desktop, CLI, and cloud](docs/installation.md#claude-code) |
| [OpenAI Codex](#openai-codex) | Git marketplace plugin | [App, CLI, IDE, and cloud](docs/installation.md#openai-codex) |
| <a id="cursor"></a>[Cursor](docs/installation.md#cursor) | Global skill | [Local and remote](docs/installation.md#cursor) |
| <a id="google-antigravity"></a>[Google Antigravity](docs/installation.md#google-antigravity) | Separate desktop skill and CLI plugin | [Both surfaces](docs/installation.md#google-antigravity) |
| <a id="github-copilot"></a>[GitHub Copilot](docs/installation.md#github-copilot) | Git marketplace plugin | [App, CLI, and cloud](docs/installation.md#github-copilot) |
| <a id="google-gemini-cli"></a>[Google Gemini CLI](docs/installation.md#google-gemini-cli) | Git extension | [CLI](docs/installation.md#google-gemini-cli) |
| <a id="windsurf--cascade"></a>[Windsurf / Cascade](docs/installation.md#windsurf--cascade) | Global skill | [Desktop](docs/installation.md#windsurf--cascade) |
| <a id="devin"></a>[Devin](docs/installation.md#devin) | Repository skill | [Local, CLI, and cloud](docs/installation.md#devin) |
| <a id="cline"></a>[Cline](docs/installation.md#cline) | Global skill | [IDE and CLI](docs/installation.md#cline) |
| <a id="kiro"></a>[Kiro](docs/installation.md#kiro) | Skill or custom Power | [IDE, CLI, and web](docs/installation.md#kiro) |
| <a id="opencode"></a>[OpenCode](docs/installation.md#opencode) | Global skill | [Local clients](docs/installation.md#opencode) |

<a id="verification-status-right-now"></a>
Direct-install routes exist for all eleven hosts; [dated validation and catalogue details](docs/installation.md#verification-status-right-now) distinguish those routes from live-host tests and public listings.

## OpenAI Codex

For the Codex desktop app:

1. Open a new task and enter `/plugins`.
2. Choose **Add Marketplace**, then enter `roc1103/visum-releases`.
3. Install **Visum** and start a new task.
4. Mention `$visum` or ask Codex to enter Visum Mode.

The Git marketplace also serves Codex CLI on the same Mac. [CLI, IDE, cloud, verification, and update options](docs/installation.md#openai-codex) are in the full guide. The universal-directory listing is not yet available.

<a id="roo-code-legacy-only"></a>
<a id="behaviour-and-safety"></a>

## Licence and support

[Safety rules](docs/installation.md#behaviour-and-safety) and [legacy Roo instructions](docs/installation.md#roo-code-legacy-only) are in the full guide.

The [Apache License 2.0](LICENSE.txt) covers this AI integration and its wrappers. Visum Developer, Visum Player, Visum CLI, Visum Engine, and official base models have separate proprietary terms. Optional CLI diagnostics and example sharing are user-controlled; see the [legal and privacy notices](https://ai.rocompany.co.uk/legal).

[Signed downloads and release archives](https://github.com/roc1103/visum-releases/releases) · [Product information](https://ai.rocompany.co.uk/visum) · Support: `visum@rocompany.co.uk`
