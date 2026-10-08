# Visum AI Integration

Visum AI Integration gives supported coding agents one guided Visum Mode for capture, teaching, training, testing, and authorised actions. Install the integration for the agent you use; [the full installation guide](docs/installation.md) has commands, verification steps, updates, and removal instructions for every host.

## What this installs

This repository installs agent instructions and host-specific plugin, skill, or extension wrappers. It does **not** install Visum Developer, Visum Player, Visum CLI, Visum Engine, or official base models. The integration does not transmit user content.

## Local runtime

Local Visum operations require the separate Visum CLI and Engine on Apple Silicon with macOS 14 or later. Cloud agents and other operating systems can use guided instructions, but cannot control a separate Mac through that installation.

## Start here

| Host | Direct route | Full instructions |
| --- | --- | --- |
| [Claude Code](#claude-code) | Git marketplace plugin | [Desktop, CLI, and cloud](docs/installation.md#claude-code) |
| [OpenAI Codex](#openai-codex) | Git marketplace plugin | [App, CLI, IDE, and cloud](docs/installation.md#openai-codex) |
| [Cursor](#cursor) | Global skill | [Local and remote](docs/installation.md#cursor) |
| [Google Antigravity](#google-antigravity) | Separate desktop skill and CLI plugin | [Both surfaces](docs/installation.md#google-antigravity) |
| [GitHub Copilot](#github-copilot) | Git marketplace plugin | [App, CLI, and cloud](docs/installation.md#github-copilot) |
| [Google Gemini CLI](#google-gemini-cli) | Git extension | [CLI](docs/installation.md#google-gemini-cli) |
| [Windsurf / Cascade](#windsurf--cascade) | Global skill | [Desktop](docs/installation.md#windsurf--cascade) |
| [Devin](#devin) | Repository skill | [Local, CLI, and cloud](docs/installation.md#devin) |
| [Cline](#cline) | Global skill | [IDE and CLI](docs/installation.md#cline) |
| [Kiro](#kiro) | Skill or custom Power | [IDE, CLI, and web](docs/installation.md#kiro) |
| [OpenCode](#opencode) | Global skill | [Local clients](docs/installation.md#opencode) |

<a id="verification-status-right-now"></a>
Direct-install routes exist for all eleven hosts. The isolated lifecycle harness passed for all eleven; Codex and Cursor also passed live-host tests. A Copilot account policy blocked its model session, and the remaining eight packages were not live-tested in every app. Claude, Cursor, and Kiro public listings remain under review; OpenAI universal-directory submission is incomplete. Host instructions and marketplace status were checked against official documentation on 1 September 2026. [Validation details](docs/installation.md#verification-status-right-now).

## OpenAI Codex

For the Codex desktop app:

1. Open a new task and enter `/plugins`.
2. Choose **Add Marketplace**, then enter `roc1103/visum-releases`.
3. Install **Visum** and start a new task.
4. Mention `$visum` or ask Codex to enter Visum Mode.

The Git marketplace also serves Codex CLI on the same Mac. [CLI, IDE, cloud, verification, and update options](docs/installation.md#openai-codex) are in the full guide. The universal-directory listing is not yet available.

## Other hosts

## Claude Code

[Claude Desktop, CLI, SSH, and cloud installation](docs/installation.md#claude-code).

## Cursor

[Cursor desktop, CLI, and remote installation](docs/installation.md#cursor).

## Google Antigravity

[Antigravity desktop and `agy` installation](docs/installation.md#google-antigravity).

## GitHub Copilot

[Copilot app, CLI, and cloud installation](docs/installation.md#github-copilot).

## Google Gemini CLI

[Gemini CLI extension installation](docs/installation.md#google-gemini-cli).

## Windsurf / Cascade

[Windsurf desktop installation](docs/installation.md#windsurf--cascade).

## Devin

[Devin Local, CLI, and cloud installation](docs/installation.md#devin).

## Cline

[Cline IDE and CLI installation](docs/installation.md#cline).

## Kiro

[Kiro IDE, CLI, web, and Power installation](docs/installation.md#kiro).

## OpenCode

[OpenCode local installation](docs/installation.md#opencode).

## Roo Code (legacy only)

Roo Code is not a current supported target. [Legacy instructions](docs/installation.md#roo-code-legacy-only) remain available for historical installations.

## Behaviour and safety

Visum Mode requires explicit authority for Confector actions. It does not silently accept licences, enable diagnostics, upload visual data, or publish artifacts. [Full behaviour and safety rules](docs/installation.md#behaviour-and-safety).

## Licence and support

The [Apache License 2.0](LICENSE.txt) covers this AI integration and its wrappers. Visum Developer, Visum Player, Visum CLI, Visum Engine, and official base models have separate proprietary terms. Optional CLI diagnostics and example sharing are user-controlled; see the [legal and privacy notices](https://ai.rocompany.co.uk/legal).

[Signed downloads and release archives](https://github.com/roc1103/visum-releases/releases) · [Product information](https://ai.rocompany.co.uk/visum) · Support: `visum@rocompany.co.uk`
