# Visum AI Skill

This repository is the official native integration source for Visum. It packages one canonical `skills/visum` behaviour tree for eleven AI coding agents. Visum Mode, guided numbered choices, `y`/`n` replies, natural conversation, entry and exit behaviour, local CLI orchestration, update checks, diagnostics boundaries and Confector authority rules are identical in every package.

The host AI handles conversation. The local Visum CLI and Visum Engine perform visual capture, teaching, training, testing, inference and authorised actions. Installing this integration does not install the separate Visum CLI or accept any licence for the user.

## Claude Code

Native form: Claude Code plugin in the independent Visum marketplace.

Run these commands inside Claude Code:

```text
/plugin marketplace add roc1103/visum-releases
/plugin install visum@visum
/reload-plugins
```

Enter Visum Mode with `/visum:visum` or ask Claude to use Visum. Claude Code refreshes this Git-backed marketplace through its normal plugin update flow.

## OpenAI Codex

Native form: Codex plugin in the Visum Git marketplace.

```sh
codex plugin marketplace add roc1103/visum-releases
codex plugin add visum@visum
```

Mention `$visum` or ask Codex to enter Visum Mode. Refresh the source later with `codex plugin marketplace upgrade visum`.

## Cursor

Native form: portable Agent Plugin.

The repository root is a valid Agent Plugin and is prepared for Cursor Marketplace submission. Until it has been submitted and the marketplace review has completed, local validation is available by copying or linking this repository to `~/.cursor/plugins/local/visum`, reloading Cursor, and confirming the Visum skill in Customize. This development route is not presented as a marketplace installation.

Once listed, install Visum from Cursor's Customize page and invoke `/visum` or ask Cursor to enter Visum Mode.

## Google Antigravity

Native form: portable Agent Plugin.

```sh
agy plugin install https://github.com/roc1103/visum-releases
```

Then ask Antigravity to use Visum or enter Visum Mode. Update and remove it through Antigravity's normal plugin controls.

## GitHub Copilot

Native form: Agent Plugin in the Visum Git marketplace for GitHub Copilot CLI.

```sh
copilot plugin marketplace add roc1103/visum-releases
copilot plugins install visum@visum
```

Then ask Copilot to use Visum or invoke the installed Visum skill. Copilot's plugin dashboard reports available upstream updates; refresh the source with `copilot plugin marketplace update visum`.

## Google Gemini CLI

Native form: Gemini CLI extension with the canonical Agent Skill bundled under `skills/`.

```sh
gemini extensions install https://github.com/roc1103/visum-releases --ref main
```

Restart Gemini CLI after installation, then ask it to use Visum. Update with `gemini extensions update visum` and uninstall with `gemini extensions uninstall visum`.

Gemini CLI's individual-user service is transitioning to Antigravity CLI. Existing compatible installations remain supported by this extension; new individual users should use the Antigravity plugin where Gemini CLI is no longer available to their account.

## Windsurf

Native form: Cascade Agent Skill. Windsurf does not provide an appropriate public behavioural-plugin marketplace for this integration.

From a verified checkout of this repository:

```sh
./install-native-skill.sh windsurf
```

Reload Windsurf, then mention `@visum` or ask Cascade to enter Visum Mode.

## Cline

Native form: Cline Agent Skill for the Cline IDE extension.

```sh
./install-native-skill.sh cline
```

Then ask Cline to use Visum. Cline's separate executable plugin API applies to Cline CLI, SDK and Kanban—not its VS Code or JetBrains extension—so this behavioural integration deliberately uses Cline's supported skill mechanism.

## Kiro

Native form: Kiro Power using the Agent Plugins standard.

In Kiro, open Powers, choose Add Custom Power, choose Import from GitHub, and enter:

```text
https://github.com/roc1103/visum-releases
```

Then ask Kiro to use the Visum Power or enter Visum Mode.

## Roo Code

Native form: Roo Agent Skill. Roo Code does not provide an appropriate public behavioural-plugin format for this integration.

```sh
./install-native-skill.sh roo
```

Then ask Roo Code to use Visum.

## OpenCode

Native form: OpenCode Agent Skill. OpenCode's executable JavaScript/TypeScript plugin interface is not used to disguise behavioural instructions as code.

```sh
./install-native-skill.sh opencode
```

Then ask OpenCode to use Visum.

## Behaviour and safety

All integrations use the same canonical files under `skills/visum`. Native wrappers do not change:

- Visum Mode's layered answers, numbered choices and compact replies;
- the distinction between the conversational host and local Visum Engine;
- local-first handling of captures, models and artifacts;
- licence, rights, diagnostics and publication checks;
- the requirement for explicit, grounded authority before Confector actions; or
- evidence-backed completion and error reporting.

The Visum skill never silently accepts licences, enables diagnostics, uploads visual data, publishes artifacts, or authorises a computer action.

## Updates

Plugin, extension and Power installations use their host's native Git update path. Native-skill installations use Visum's signed skill update workflow or a verified reinstall from this repository. Each release is validated to ensure every packaged skill tree is byte-identical.

## Releases

Signed and notarised Visum Developer and Visum Player builds, Visum CLI and release archives are available from [GitHub Releases](https://github.com/roc1103/visum-releases/releases).

Product information: [ai.rocompany.co.uk/visum](https://ai.rocompany.co.uk/visum)
