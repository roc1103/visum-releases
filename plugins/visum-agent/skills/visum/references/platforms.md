# Supported AI coding agents

Visum uses one canonical Agent Skill. Native wrappers change only installation, discovery, invocation and update handling; they must not create divergent behavioural instructions.

The official public source is `https://github.com/roc1103/visum-releases`.

## Native integrations

| Target | Native form | Installation or import | Activation |
|---|---|---|---|
| Claude Code | Claude Code plugin in an independent marketplace | Add marketplace `roc1103/visum-releases`, then install `visum@visum` | Invoke `/visum:visum` or ask Claude to use Visum. |
| Codex | Codex plugin in a Git marketplace | Add marketplace `roc1103/visum-releases`, then add `visum@visum` | Mention `$visum` or ask Codex to enter Visum Mode. |
| Cursor | Agent Plugin | Install Visum from Cursor Marketplace when listed; local validation may use `~/.cursor/plugins/local/visum` | Invoke `/visum` or ask Cursor to enter Visum Mode. |
| Google Antigravity | Agent Plugin | `agy plugin install https://github.com/roc1103/visum-releases` | Ask Antigravity to use Visum or enter Visum Mode. |
| GitHub Copilot CLI | Agent Plugin in a Git marketplace | Add marketplace `roc1103/visum-releases`, then install `visum@visum` | Ask Copilot to use Visum or invoke the installed skill. |
| Google Gemini CLI | Gemini CLI extension with bundled Agent Skill | `gemini extensions install https://github.com/roc1103/visum-releases` | Restart Gemini CLI, then ask it to use Visum. |
| Windsurf Cascade | Native Cascade Skill | Install the canonical skill at `~/.codeium/windsurf/skills/visum` | Mention `@visum` or ask Cascade to enter Visum Mode. |
| Cline | Native Cline Skill | Install the canonical skill at `~/.cline/skills/visum` | Ask Cline to use Visum. |
| Kiro | Kiro Power using the Agent Plugins standard | In the Powers panel, import `https://github.com/roc1103/visum-releases` from GitHub | Ask Kiro to use the Visum Power or enter Visum Mode. |
| Roo Code | Native Roo Skill | Install the canonical skill at `~/.roo/skills/visum` | Ask Roo Code to use Visum. |
| OpenCode | Native OpenCode Skill | Install the canonical skill at `~/.config/opencode/skills/visum` | Ask OpenCode to use Visum. |

Windsurf, Cline's IDE extension, Roo Code and OpenCode do not expose an appropriate public behavioural-plugin format. Their supported native integration is an Agent Skill. Do not describe those packages as marketplace plugins or invent executable wrappers merely to use the word `plugin`.

Google Gemini CLI's individual-user service has begun transitioning to Antigravity CLI. Keep its extension compatible for existing installations, but recommend the Antigravity Agent Plugin to new individual users when Gemini CLI is no longer available to their account.

## Claude Code

In Claude Code, run:

```text
/plugin marketplace add roc1103/visum-releases
/plugin install visum@visum
/reload-plugins
```

The plugin skill is namespaced as `/visum:visum`. Claude's marketplace copy provides versioned updates; refresh the marketplace before updating when needed.

## Codex

In Terminal, run:

```sh
codex plugin marketplace add roc1103/visum-releases
codex plugin add visum@visum
```

Use `codex plugin marketplace upgrade visum` to refresh the Git marketplace. The Codex plugin manifest and the Agent Plugin manifest intentionally coexist because Codex uses its own validated plugin metadata.

## Native-skill installation

For Windsurf, Cline, Roo Code and OpenCode, use the installer inside an extracted official skill or a verified checkout:

```sh
./skills/visum/scripts/install_agent_skill.sh --target windsurf
./skills/visum/scripts/install_agent_skill.sh --target cline
./skills/visum/scripts/install_agent_skill.sh --target roo
./skills/visum/scripts/install_agent_skill.sh --target opencode
```

The installer refuses to overwrite an existing skill. Use `--replace` only when the user explicitly requests replacement; it retains the previous skill in a reported backup directory.

## Behaviour and updates

Every native package carries the same `skills/visum` tree. Verify byte-for-byte parity when building a release. Platform wrappers must not weaken Visum's evidence, rights, diagnostics, publication or Confector authority boundaries.

Use each host's native marketplace, plugin, extension or Power updater when one exists. Native-skill installations update through the signed Visum skill updater or by reinstalling the same newer official skill package. Do not assume one platform's personal directory is shared by another.
