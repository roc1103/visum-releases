# Supported AI coding agents

Visum uses one canonical Agent Skill. Native wrappers change only installation, discovery, invocation and update handling; they must not create divergent behavioural instructions.

The official public source is `https://github.com/roc1103/visum-releases`.

## Native integrations

| Target | Native form | Installation or import | Activation |
|---|---|---|---|
| Claude Code terminal client | Claude Code plugin in an independent marketplace | Add marketplace `roc1103/visum-releases`, then install `visum@visum` | Invoke `/visum:visum` or ask Claude to use Visum. |
| Claude Code web/desktop project | Repository skill | Commit the canonical skill at `.claude/skills/visum` in the selected repository | Ask Claude to use Visum or enter Visum Mode. |
| Codex | Codex plugin in a Git marketplace | Add marketplace `roc1103/visum-releases`, then add `visum@visum` | Mention `$visum` or ask Codex to enter Visum Mode. |
| Cursor | Agent Plugin | Install Visum from Cursor Marketplace when listed; local validation may use `~/.cursor/plugins/local/visum` | Invoke `/visum` or ask Cursor to enter Visum Mode. |
| Google Antigravity | Agent Plugin | `agy plugin install https://github.com/roc1103/visum-releases` | Ask Antigravity to use Visum or enter Visum Mode. |
| GitHub Copilot CLI and app | Agent Plugin in a Git marketplace | Add marketplace `roc1103/visum-releases`, then install `visum@visum` | Ask Copilot to use Visum or invoke the installed skill. |
| Google Gemini CLI | Gemini CLI extension with bundled Agent Skill | `gemini extensions install https://github.com/roc1103/visum-releases --ref main --auto-update` | Restart Gemini CLI, then ask it to use Visum. |
| Windsurf / Devin Desktop Cascade | Native Cascade Skill | Install the canonical skill at `~/.codeium/windsurf/skills/visum` | Mention `@visum` or ask Cascade to enter Visum Mode. |
| Cline | Native Cline Skill | Install the canonical skill at `~/.cline/skills/visum` | Ask Cline to use Visum. |
| Kiro | Kiro Power using the Agent Plugins standard | In the Powers panel, import `https://github.com/roc1103/visum-releases` from GitHub | Ask Kiro to use the Visum Power or enter Visum Mode. |
| Roo Code (legacy only) | Historical Roo Skill | Existing historical users may install at `~/.roo/skills/visum` | No current support; migrate to Cline. |
| OpenCode | Native OpenCode Skill | Install the canonical skill at `~/.config/opencode/skills/visum` | Ask OpenCode to use Visum. |

Windsurf/Devin Desktop, Cline and OpenCode do not expose an appropriate public behavioural-plugin marketplace for this integration. Their supported native integration is an Agent Skill. Do not describe those packages as marketplace plugins or invent executable wrappers merely to use the word `plugin`.

Since 2026-06-18, ordinary individual Google AI subscriptions are no longer served by Gemini CLI. Keep its extension compatible for supported enterprise and API-key/provider installations, and recommend the Antigravity Agent Plugin to individual users.

Roo Code and its services shut down on 2026-05-15. Preserve its installer only as a legacy convenience for already-installed copies. Do not count it as a current target or imply compatibility with Roomote.

## Claude Code terminal client

In an interactive Claude Code terminal session, run:

```text
/plugin marketplace add roc1103/visum-releases
/plugin install visum@visum
/reload-plugins
```

The plugin skill is namespaced as `/visum:visum`. Claude's marketplace copy provides versioned updates; refresh the marketplace before updating when needed.

These `/plugin` commands are not chat commands and are not available in Claude Code's web/desktop Code tab.

## Claude Code web/desktop projects

Claude Code's hosted project sessions receive repository configuration, not a developer's local user-level plugin installation. Install the canonical Visum skill into the repository and commit it:

```sh
curl -fsSL https://raw.githubusercontent.com/roc1103/visum-releases/v0.1.4/install-claude-code-app.sh | sh -s -- --project "$PWD"
git add .claude/skills/visum
git commit -m "Add Visum skill for Claude Code"
```

The installer refuses to replace an existing project skill unless `--replace` is explicitly supplied. Use `--remove` to remove only the Visum project skill. For a local Claude Code installation that loads user skills, use `--user` instead.

Project-skill discovery and Visum Engine execution are separate. Claude's hosted Code environment is not a macOS runtime and cannot run the local Apple-silicon Visum Engine. Use local Claude Code, or Remote Control connected to a local Claude Code session, for live Mac capture, training, inference and explicitly authorised Confector actions.

## Codex

In Terminal, run:

```sh
codex plugin marketplace add roc1103/visum-releases
codex plugin add visum@visum
```

Use `codex plugin marketplace upgrade visum` to refresh the Git marketplace. The Codex plugin manifest and the Agent Plugin manifest intentionally coexist because Codex uses its own validated plugin metadata.

## Native-skill installation

For Claude Code project/user skills, Windsurf/Devin Desktop, Cline and OpenCode, use the installer inside an extracted official skill or a verified checkout:

```sh
./skills/visum/scripts/install_claude_code_app.sh --project /path/to/repository
./skills/visum/scripts/install_claude_code_app.sh --user
./skills/visum/scripts/install_agent_skill.sh --target windsurf
./skills/visum/scripts/install_agent_skill.sh --target cline
./skills/visum/scripts/install_agent_skill.sh --target opencode
```

Historical Roo Code users may still use `--target roo`, but it is deliberately excluded from current all-target installation.

The installer refuses to overwrite an existing skill. Use `--replace` only when the user explicitly requests replacement; it retains the previous skill in a reported backup directory. Use `--remove` with one exact target (or `all` plus the Copilot project path) when the user explicitly requests removal.

## Behaviour and updates

Every native package carries the same `skills/visum` tree. Verify byte-for-byte parity when building a release. Platform wrappers must not weaken Visum's evidence, rights, diagnostics, publication or Confector authority boundaries.

Use each host's native marketplace, plugin, extension or Power updater when one exists. Native-skill installations update through the signed Visum skill updater or by reinstalling the same newer official skill package. Do not assume one platform's personal directory is shared by another.
