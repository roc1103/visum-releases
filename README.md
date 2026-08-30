# Visum AI Skill

This repository is the official native integration source for Visum. It packages one canonical `skills/visum` behaviour tree for ten current AI coding agents, plus a legacy Roo Code installation path. Visum Mode, guided numbered choices, `y`/`n` replies, natural conversation, entry and exit behaviour, local CLI orchestration, update checks, diagnostics boundaries and Confector authority rules are identical in every current package.

The host AI handles conversation. The local Visum CLI and Visum Engine perform visual capture, teaching, training, testing, inference and authorised actions. This integration is open source, but it does not install the separate Visum CLI or accept the proprietary CLI/model installation terms on the user's behalf.

## Licence

The source in this repository is licensed under the [Apache License 2.0](LICENSE.txt). This licence applies only to the Visum AI integration and its host-agent wrappers. Visum Developer, Visum Player, the Visum CLI, Visum Engine and official untrained RO Company base models are separate proprietary products governed by their own terms.

The integration itself does not transmit user content. Optional Visum CLI diagnostics and explicit example sharing are separate, user-controlled features documented in the skill and covered by the [Visum legal and privacy notices](https://ai.rocompany.co.uk/legal). Support is available at `visum@rocompany.co.uk`.

## Claude Code terminal client

Native form: Claude Code plugin in the independent Visum marketplace.

Run these commands inside an interactive Claude Code terminal session:

```text
/plugin marketplace add roc1103/visum-releases
/plugin install visum@visum
/reload-plugins
```

Enter Visum Mode with `/visum:visum` or ask Claude to use Visum. Claude Code refreshes this Git-backed marketplace through its normal plugin update flow.

The `/plugin` commands are terminal-client commands. They are not available as chat commands in Claude Code's web/desktop Code tab.

## Claude Code web/desktop projects

Native form: a project skill committed at `.claude/skills/visum` in the repository Claude opens.

From the repository directory in Terminal, install the verified project skill:

```sh
curl -fsSL https://raw.githubusercontent.com/roc1103/visum-releases/v0.1.7/install-claude-code-app.sh | sh -s -- --project "$PWD"
```

Then commit `.claude/skills/visum` to that repository. New Claude Code web/desktop cloud sessions clone the skill with the project and can enter Visum Mode when asked. A local Claude Code installation may instead use `--user` to install at `~/.claude/skills/visum`.

Claude's hosted Code environment cannot run the macOS-only local Visum Engine. For live Mac capture, training, inference and Confector actions, use a local Claude Code session (including Remote Control to that local session). Hosted sessions can still use the Visum behaviour and work on compatible project files.

## OpenAI Codex

Native form: Codex plugin in the Visum Git marketplace.

```sh
codex plugin marketplace add roc1103/visum-releases
codex plugin add visum@visum
```

Mention `$visum` or ask Codex to enter Visum Mode. Refresh the source later with `codex plugin marketplace upgrade visum`.

## Cursor

Native form: portable Agent Plugin.

The repository root is a portable Agent Plugin. RO Company submitted it to Cursor Marketplace for manual review on 2026-08-30. It is not represented as listed or approved until Cursor completes that review. Local validation is available by copying or linking this repository to `~/.cursor/plugins/local/visum`, reloading Cursor, and confirming the Visum skill in Customize. This development route is not presented as a marketplace installation.

Once listed, install Visum from Cursor's Customize page and invoke `/visum` or ask Cursor to enter Visum Mode.

## Google Antigravity

Native form: portable Agent Plugin.

```sh
agy plugin install https://github.com/roc1103/visum-releases
```

Then ask Antigravity to use Visum or enter Visum Mode. Update and remove it through Antigravity's normal plugin controls. This root package has passed validation and remote-install testing with Antigravity CLI 1.1.22.

## GitHub Copilot

Native form: Agent Plugin in the Visum Git marketplace for GitHub Copilot CLI and the GitHub Copilot app.

```sh
copilot plugin marketplace add roc1103/visum-releases
copilot plugin install visum@visum
```

Then ask Copilot to use Visum or invoke the installed Visum skill. Copilot's plugin dashboard reports available upstream updates; refresh the source with `copilot plugin marketplace update visum`.

## Google Gemini CLI

Native form: Gemini CLI extension with the canonical Agent Skill bundled under `skills/`.

```sh
gemini extensions install https://github.com/roc1103/visum-releases --ref main --auto-update
```

Restart Gemini CLI after installation, then ask it to use Visum. The `--auto-update` option lets Gemini refresh the extension; update explicitly with `gemini extensions update visum` and uninstall with `gemini extensions uninstall visum`.

Since 2026-06-18, ordinary individual Google AI subscriptions are no longer served by Gemini CLI. The extension remains available to supported enterprise and API-key/provider installations. Individual users should use the Antigravity plugin.

## Windsurf / Devin Desktop

Native form: Cascade Agent Skill. Windsurf/Devin Desktop does not provide an appropriate public behavioural-skill marketplace for this integration.

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

Then ask Cline to use Visum. Cline's MCP marketplace and executable extension mechanisms are not substitutes for an IDE behavioural skill, so this integration deliberately uses Cline's documented skill folders.

## Kiro

Native form: Kiro Power using the Agent Plugins standard.

In Kiro, open Powers, choose Add Custom Power, choose Import from GitHub, and enter:

```text
https://github.com/roc1103/visum-releases
```

Then ask Kiro to use the Visum Power or enter Visum Mode.

## Roo Code (legacy only)

Roo Code and its services shut down on 2026-05-15 and the source repository is archived. It is not a current supported target. The command below is retained only for people who still have a historical Roo Code installation:

```sh
./install-native-skill.sh roo
```

No new user should install Roo Code for Visum. Cline is the migration path recommended by the former Roo maintainers. Roomote is a different product and has not been validated for Visum.

## OpenCode

Native form: OpenCode Agent Skill. OpenCode's executable JavaScript/TypeScript plugin interface is not used to disguise behavioural instructions as code.

```sh
./install-native-skill.sh opencode
```

Then ask OpenCode to use Visum. OpenCode V2 also supports managed HTTP skill catalogues; Visum will advertise that route only after its versioned catalogue has been published and fetched successfully.

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
