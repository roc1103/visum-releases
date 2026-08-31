# Visum AI Integration

This repository teaches supported AI coding agents how to operate Visum through one canonical `skills/visum` behaviour tree. Every integration gets the same guided Visum Mode, numbered choices, `y`/`n` replies, natural-language fallback, local CLI orchestration, update checks, diagnostics boundaries and Confector authority rules.

The integration is available for eleven current hosts. Some hosts install a plugin, some install an Agent Skill, and Gemini CLI installs an extension. Those are different packaging routes for the same Visum behaviour.

## What this does — and what it does not install

The host AI conducts the conversation. The separate Visum CLI and Visum Engine perform capture, teaching, training, testing, inference and explicitly authorised Confector actions.

Installing this repository does **not** install Visum Developer, Visum Player, the Visum CLI, Visum Engine or the official base models. On a supported Mac, Visum Mode can guide the user through installing the Visum CLI before the first local operation. A cloud-hosted agent can discuss Visum and edit compatible repository files, but it cannot directly capture or control the user's Mac unless that host is connected to a local Mac session.

## Current compatibility

| Host | Works in | Available now | Distribution status |
| --- | --- | --- | --- |
| Claude Code | Terminal CLI; local/SSH sessions in Claude Desktop; repository skill in cloud sessions | Yes | Independent Git marketplace works now; official-directory submission is pending review |
| OpenAI Codex | Codex in the ChatGPT desktop app; Codex CLI | Yes | Independent Git marketplace works now; not listed in the universal directory |
| Cursor | Desktop and Cursor CLI | Yes, by native skill install | Direct skill installation works; Cursor Marketplace submission is pending review |
| Google Antigravity | Antigravity CLI and Antigravity 2.0 desktop | Yes, with separate CLI and desktop routes | Direct installation; no marketplace approval required |
| GitHub Copilot | Copilot CLI; Copilot app; repository-scoped skill | Yes | Independent Git marketplace works now; the Awesome Copilot public-listing submission was not accepted |
| Google Gemini CLI | Gemini CLI only | Yes | Direct Git extension installation |
| Windsurf / Cascade | Desktop Cascade | Yes | Direct global Agent Skill installation |
| Devin | Cloud sessions, Devin Desktop/Local and Devin CLI when the repository is attached | Yes, as a repository skill | Devin's plugin marketplace is closed beta; no public listing is claimed |
| Cline | IDE extension and Cline CLI/TUI | Yes | Direct global Agent Skill installation |
| Kiro | Kiro IDE | Yes | Direct Git Power import; registry submission is pending, and CLI/Web support is not claimed while Kiro's own pages conflict |
| OpenCode | Local OpenCode clients that use the standard skill directories | Yes | Direct global Agent Skill installation |

“Available now” means the package and its direct installation route exist. It does not mean an external marketplace has completed its review. Marketplace status was last checked on 31 August 2026.

## Before using a native-skill command

The native-skill sections below use a verified checkout of this repository. In Terminal:

```sh
git clone --depth 1 https://github.com/roc1103/visum-releases.git
cd visum-releases
```

If the folder already exists, update it instead:

```sh
git -C visum-releases pull --ff-only
cd visum-releases
```

The installer refuses to overwrite an existing Visum skill unless `--replace` is supplied. When replacement is authorised, it retains the previous copy and prints its backup location.

## Claude Code

**Works in:** Claude Code CLI and local/SSH Code sessions in Claude Desktop. Repository skills also load in cloud sessions. Claude's desktop documentation confirms that local desktop sessions can use personal, project and plugin skills, while cloud sessions use repository or account-synced configuration.

### Install the plugin in Claude Code CLI

Run these inside an interactive Claude Code terminal session:

```text
/plugin marketplace add roc1103/visum-releases
/plugin install visum@visum
/reload-plugins
```

Start with `/visum:visum` or ask Claude to enter Visum Mode.

### Install for the Claude Desktop app without `/plugin`

For all local desktop projects, install the personal skill from Terminal:

```sh
curl -fsSL https://raw.githubusercontent.com/roc1103/visum-releases/v0.1.9/install-claude-code-app.sh | sh -s -- --user
```

Restart the local Claude Code session. Type `/` or use **+ → Slash commands**, then choose `visum`; asking Claude to enter Visum Mode also works.

Claude Desktop now also has **+ → Plugins → Add plugin** for plugins from configured marketplaces. Registering this independent marketplace still requires the terminal or a managed/project setting until Visum appears in Anthropic's official directory.

### Install for Claude cloud sessions

From the repository that Claude will open:

```sh
curl -fsSL https://raw.githubusercontent.com/roc1103/visum-releases/v0.1.9/install-claude-code-app.sh | sh -s -- --project "$PWD"
git add .claude/skills/visum
git commit -m "Add Visum skill"
```

Push that commit. Claude will discover the skill when it opens the repository. Cloud sessions can use the guided behaviour and repository files, but they cannot run the macOS-only Visum Engine on the user's computer.

### Update, remove or troubleshoot

- Plugin: `/plugin marketplace update visum`, then `/reload-plugins`. Third-party marketplace auto-update is off by default unless the user enables it in the marketplace settings.
- Personal skill: rerun the `--user` installer with `--replace` after a new integration release.
- Project skill: rerun the `--project` installer with `--replace`, then commit the change.
- Remove the plugin: `/plugin uninstall visum@visum`.
- If `/plugin` is unknown, update Claude Code. In the desktop app, use the local-skill route above rather than typing `/plugin` into an ordinary chat.

Official references: [Claude Desktop skills and plugins](https://code.claude.com/docs/en/desktop), [Claude plugin installation and updates](https://code.claude.com/docs/en/discover-plugins).

## OpenAI Codex

**Works in:** Codex in the ChatGPT desktop app and Codex CLI. OpenAI documents plugin browsing in both supported surfaces; the IDE extension does not support plugins.

### Install

Run in Terminal:

```sh
codex plugin marketplace add roc1103/visum-releases
codex plugin add visum@visum
```

Start a new Codex session. Mention `$visum` or ask Codex to enter Visum Mode. The same local Codex configuration is available to the desktop app and CLI on that Mac.

### Update, remove or troubleshoot

```sh
codex plugin marketplace upgrade visum
codex plugin remove visum@visum
```

Use the first command to refresh Visum. Use the second only to remove it. In Codex CLI, `/plugins` opens the plugin browser. If the desktop app was already open during installation or update, start a new task.

Official reference: [OpenAI plugins in ChatGPT and Codex](https://learn.chatgpt.com/docs/plugins).

## Cursor

**Works in:** Cursor desktop and Cursor CLI. Cursor supports the Agent Plugins format used at this repository root.

### Install now

Until Cursor completes marketplace review, install the native skill from a checkout:

```sh
./install-native-skill.sh cursor
```

Restart Cursor or run **Developer: Reload Window**. Open **Customize → Skills**, confirm `visum` is enabled, then use `/visum` or ask Cursor to enter Visum Mode. The global skill is also visible to Cursor CLI on the same account and machine.

### Marketplace route if a public listing is approved later

Once Visum is listed, install it from **Customize → Plugins**. For development testing, Cursor also supports adding this Git marketplace with:

```sh
cursor-agent plugin marketplace add https://github.com/roc1103/visum-releases
```

That command registers a marketplace; it does not itself install the plugin. Finish installation in Customize.

### Update, remove or troubleshoot

```sh
# Update
git pull --ff-only
./install-native-skill.sh cursor --replace

# Remove
./install-native-skill.sh cursor --remove
```

Run only the update pair or the remove command, not both. Reload Cursor afterward. If an organisation disables local plugin imports, use the native skill route or ask its administrator to allow the reviewed marketplace listing.

Official references: [Cursor Agent Skills and global paths](https://cursor.com/docs/skills), [Cursor plugins and local testing](https://cursor.com/docs/plugins).

## Google Antigravity

**Works in:** Antigravity CLI and Antigravity 2.0 desktop. They share the agent model but use different global installation directories, so use the route for the surface you actually run.

### Antigravity CLI

```sh
agy plugin install https://github.com/roc1103/visum-releases
```

Restart `agy`, run `/skills` to confirm Visum is present, then ask Antigravity to enter Visum Mode.

To remove it:

```sh
agy plugin uninstall visum
```

If the installed CLI has no plugin update command, uninstall and reinstall from the same trusted Git URL to refresh it.

### Antigravity 2.0 desktop

From a repository checkout:

```sh
./install-native-skill.sh antigravity
```

Restart Antigravity 2.0 and ask it to enter Visum Mode. This copies Visum to the documented global desktop skill path, `~/.gemini/config/skills/visum`.

Update or remove the desktop skill with:

```sh
# Update
git pull --ff-only
./install-native-skill.sh antigravity --replace

# Remove
./install-native-skill.sh antigravity --remove
```

Official references: [Antigravity plugins and CLI commands](https://www.antigravity.google/docs/cli/plugins/), [Antigravity global skills](https://antigravity.google/docs/skills/).

## GitHub Copilot

**Works in:** GitHub Copilot CLI and the GitHub Copilot app. A repository skill also travels with a project for supported Copilot agents.

### Install the plugin for Copilot CLI

```sh
copilot plugin marketplace add roc1103/visum-releases
copilot plugin install visum@visum
```

Ask Copilot to enter Visum Mode. In an interactive Copilot CLI session, the equivalent commands are available under `/plugin`.

### Use the Copilot app or a repository-scoped skill

The Copilot app exposes plugins under **Customize → Plugins**. If the independent Git marketplace is not visible in that client, install the repository skill instead:

```sh
./install-native-skill.sh copilot --project /absolute/path/to/repository
```

Commit `.github/skills/visum` so it follows the repository.

### Update, remove or troubleshoot

```sh
# Refresh the marketplace, then update the installed plugin
copilot plugin marketplace update visum
copilot plugin update visum@visum

# Remove
copilot plugin uninstall visum
```

The first two commands refresh the marketplace catalog and then the installed plugin. The third removes it. Do not use the old `copilot plugin marketplace update` command as though it also updates an installed plugin; these are separate operations.

Official references: [About Copilot plugins and app support](https://docs.github.com/en/copilot/concepts/agents/about-plugins), [installing Copilot CLI plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing).

The independent marketplace above passed GitHub's automated manifest, lint and installation checks. Its separate Awesome Copilot listing request was rejected because it did not fit that repository at the time; this does not disable direct installation from this repository. [Public submission record](https://github.com/github/awesome-copilot/issues/2867).

## Google Gemini CLI

**Works in:** Gemini CLI only. These extension-management commands must be run in the normal shell, not inside Gemini's interactive prompt.

### Install

```sh
gemini extensions install https://github.com/roc1103/visum-releases --ref main --auto-update
```

Restart Gemini CLI, run `/extensions list` to confirm Visum is loaded, then ask it to enter Visum Mode.

### Update or remove

```sh
# Update
gemini extensions update visum

# Remove
gemini extensions uninstall visum
```

The extension remains usable for supported enterprise and API-key/provider installations. Since 18 June 2026, ordinary individual Google AI subscriptions are directed to Antigravity rather than Gemini CLI.

Official references: [Gemini CLI extension commands](https://github.com/google-gemini/gemini-cli/blob/main/docs/extensions/reference.md), [Google's Gemini CLI transition notice](https://developers.googleblog.com/an-important-update-transitioning-gemini-cli-to-antigravity-cli/).

## Windsurf / Cascade

**Works in:** desktop Cascade. The skill is global on the current machine.

### Install

```sh
./install-native-skill.sh windsurf
```

Reload the app. Open the Cascade customisations menu and confirm Visum appears under **Skills**, then type `@visum` or ask Cascade to enter Visum Mode.

### Update or remove

```sh
# Update
git pull --ff-only
./install-native-skill.sh windsurf --replace

# Remove
./install-native-skill.sh windsurf --remove
```

Official reference: [Cascade Skills, global paths and `@` invocation](https://docs.windsurf.com/windsurf/cascade/skills).

## Devin

**Works in:** Devin cloud sessions, Devin Desktop/Local and Devin CLI when the project repository is available. Devin skills are repository-scoped; there is no general user-global skill install.

### Install into a repository

```sh
./install-native-skill.sh devin --project /absolute/path/to/repository
```

Commit and push `.agents/skills/visum`. Devin discovers it from the connected repository. Start explicitly with `@skills:visum`, or ask Devin to enter Visum Mode.

### Update or remove

```sh
# Update
git pull --ff-only
./install-native-skill.sh devin --project /absolute/path/to/repository --replace

# Remove
./install-native-skill.sh devin --project /absolute/path/to/repository --remove
```

Commit the resulting repository change. Devin's separate plugin ecosystem is currently closed beta, so Visum does not claim a public Devin marketplace listing.

Official references: [Devin repository skills and invocation](https://docs.devin.ai/product-guides/skills), [Devin plugin ecosystem status](https://docs.devin.ai/product-guides/plugin-ecosystem).

## Cline

**Works in:** Cline IDE extensions and Cline CLI/TUI. Cline's global configuration is shared across its applications on the same machine.

### Install

```sh
./install-native-skill.sh cline
```

Restart Cline. In the IDE, open the Skills tab from the scale icon and confirm `visum` is enabled. Type `/visum` or ask Cline to enter Visum Mode. The same global skill is available in Cline CLI.

### Update or remove

```sh
# Update
git pull --ff-only
./install-native-skill.sh cline --replace

# Remove
./install-native-skill.sh cline --remove
```

Official references: [Cline Skills](https://docs.cline.bot/customization/skills), [shared Cline IDE and CLI configuration](https://docs.cline.bot/getting-started/config).

## Kiro

**Works in:** Kiro IDE. Kiro's August 2026 documentation currently conflicts: its capability table lists Powers for CLI v3 and Web, while its public Power registry still says Powers are IDE-only. Visum therefore claims only the verified IDE route until Kiro resolves that conflict and the other surfaces are tested.

### Install in Kiro IDE

1. Open the **Powers** panel.
2. Choose **Add Custom Power**.
3. Choose **Import power from GitHub**.
4. Enter `https://github.com/roc1103/visum-releases`.
5. Choose **Install**.

Ask Kiro to enter Visum Mode. Kiro activates relevant Powers from the conversation context.

### Update or remove

Open **Powers → Visum → Check for updates**, then choose **Install updates** if offered. Remove or disable Visum from the same Power details screen.

Official references: [Kiro Power installation from GitHub](https://kiro.dev/docs/powers/installation/), [Kiro Power surface matrix](https://kiro.dev/docs/powers/).

## OpenCode

**Works in:** local OpenCode clients that read the standard global configuration. OpenCode discovers the global path used by this installer.

### Install

```sh
./install-native-skill.sh opencode
```

Start a new OpenCode session and ask it to use the Visum skill or enter Visum Mode. OpenCode loads the full skill only when it is selected or relevant.

### Update or remove

```sh
# Update
git pull --ff-only
./install-native-skill.sh opencode --replace

# Remove
./install-native-skill.sh opencode --remove
```

If Visum is not discovered, confirm `~/.config/opencode/skills/visum/SKILL.md` exists and that OpenCode's `skill` permission is not disabled.

Official reference: [OpenCode Agent Skills and discovery paths](https://opencode.ai/docs/skills).

## Roo Code (legacy only)

Roo Code and its services shut down on 15 May 2026 and the source repository is archived. The installer retains a legacy target only for historical installations:

```sh
./install-native-skill.sh roo
```

New users should use a current host. Roo is not counted among the eleven supported integrations.

## Behaviour and safety

All integrations use the same canonical files under `skills/visum`. Native wrappers do not change:

- Visum Mode's layered answers, numbered choices and compact replies;
- the distinction between the conversational host and local Visum Engine;
- local-first handling of captures, models and artifacts;
- licence, rights, diagnostics and publication checks;
- the requirement for explicit, grounded authority before Confector actions; or
- evidence-backed completion and error reporting.

The Visum skill never silently accepts licences, enables diagnostics, uploads visual data, publishes artifacts or authorises a computer action.

## Licence and support

The source in this repository is licensed under the [Apache License 2.0](LICENSE.txt). This licence applies only to the Visum AI integration and its host-agent wrappers. Visum Developer, Visum Player, the Visum CLI, Visum Engine and official untrained RO Company base models are separate proprietary products governed by their own terms.

The integration itself does not transmit user content. Optional Visum CLI diagnostics and explicit example sharing are separate, user-controlled features documented in the skill and covered by the [Visum legal and privacy notices](https://ai.rocompany.co.uk/legal).

Support: `visum@rocompany.co.uk`

Signed and notarised Visum Developer and Visum Player builds, Visum CLI and release archives are available from [GitHub Releases](https://github.com/roc1103/visum-releases/releases).

Product information: [ai.rocompany.co.uk/visum](https://ai.rocompany.co.uk/visum)
