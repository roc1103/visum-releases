# Visum AI Integration

This repository teaches supported AI coding agents how to operate Visum through one canonical `skills/visum` behaviour tree. Every integration gets the same guided Visum Mode, numbered choices, `y`/`n` replies, natural-language fallback, local CLI orchestration, update checks, diagnostics boundaries and Confector authority rules.

The integration is available for eleven current hosts. Some hosts install a plugin, some install an Agent Skill, and Gemini CLI installs an extension. Those are different packaging routes for the same Visum behaviour.

## What this does — and what it does not install

The host AI conducts the conversation. The separate Visum CLI and Visum Engine perform capture, teaching, training, testing, inference and explicitly authorised Confector actions.

Installing this repository does **not** install Visum Developer, Visum Player, the Visum CLI, Visum Engine or the official base models. On a supported Mac, Visum Mode can guide the user through installing the Visum CLI before the first local operation. A cloud-hosted agent can discuss Visum and edit compatible repository files, but it cannot directly capture or control the user's Mac unless that host is connected to a local Mac session.

## Choose your agent and surface

There are two separate questions:

1. **Can I install Visum today?** Yes for every host in the table below, using the listed direct route.
2. **Can I find Visum by searching that company's public marketplace?** Only where the final column says so. A pending or unavailable public listing does not prevent direct installation.

| Host | Desktop/app | Terminal/CLI | Best installation available now | Public marketplace status |
| --- | --- | --- | --- | --- |
| Claude Code | Yes — local/SSH Code sessions; cloud sessions use a repository skill | Yes | Git marketplace in CLI, or a personal/project skill for desktop and cloud | Anthropic directory review pending |
| OpenAI Codex | Yes — Codex in the ChatGPT desktop app | Yes | Visum Git marketplace | Not in OpenAI's universal directory |
| Cursor | Yes | Yes, on the same local machine | Native global skill | Cursor Marketplace review pending |
| Google Antigravity | Yes — Antigravity 2.0 | Yes — `agy` | Desktop skill or the separate `agy` plugin wrapper | Direct install; no public listing required |
| GitHub Copilot | Yes — Copilot app | Yes | Visum Git marketplace | Awesome Copilot listing was declined; direct Git install works |
| Google Gemini CLI | No desktop route claimed | Yes | Git extension with auto-update | Direct Git distribution |
| Windsurf / Cascade | Yes | No CLI route claimed | Native global skill | Direct skill distribution |
| Devin | Yes — Desktop/Local and cloud sessions with a connected repository | Yes, when the repository is attached | Repository skill | Public plugins remain closed beta |
| Cline | Yes — IDE extensions | Yes — CLI/TUI | Native global skill shared by Cline apps | Direct skill distribution |
| Kiro | Yes — Kiro IDE | Not claimed | Import the repository as a Power | Kiro registry review pending |
| OpenCode | Yes, for local clients that use OpenCode configuration | Yes | Native global skill | Direct skill distribution |

The direct routes above are ready now. External review is still unfinished for the Claude, Cursor and Kiro public listings; the OpenAI universal-directory route was not submitted; and the separate Awesome Copilot listing was declined. Marketplace status was last checked on 31 August 2026.

## What users install

- A **plugin** is a host-specific package containing the Visum skill. Claude Code, Codex, Antigravity CLI and GitHub Copilot have plugin routes.
- An **Agent Skill** is the `SKILL.md` behaviour plus its references and scripts. Cursor, Antigravity desktop, Windsurf, Devin, Cline and OpenCode can load it directly.
- A **Gemini extension** packages that same skill for Gemini CLI.
- A **Kiro Power** imports the portable root Agent Plugin.

All routes load the same Visum Mode behaviour. They do not replace the local Visum CLI or Engine.

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

**Ready now:** Yes, by direct install. Anthropic's public-directory review is still pending.

**App:** Works in local and SSH Code sessions in Claude Desktop. For cloud Code sessions, put the skill in the repository.

**CLI:** Works in the interactive Claude Code terminal client.

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

**Ready now:** Yes, through the Visum Git marketplace. It is not yet in OpenAI's universal directory.

**App:** Works in Codex inside the ChatGPT desktop app.

**CLI:** Works in Codex CLI. The Codex IDE extension does not support plugins.

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

**Ready now:** Yes, through the native skill route. Cursor Marketplace review is still pending.

**App:** Works in Cursor desktop.

**CLI:** Works in Cursor CLI when it runs on the same machine. A local global skill is not copied automatically to Cursor Cloud Agents or remote workers; use a project skill there.

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

**Ready now:** Yes, but the CLI and desktop use different packages and directories.

**App:** Antigravity 2.0 desktop uses the Agent Skill route.

**CLI:** `agy` uses the Antigravity-specific plugin wrapper. Do not point `agy` at this repository's root `plugin.json`; the root manifest is the portable Agent Plugin used by Cursor and Kiro, while `agy` requires its own stricter manifest.

### Antigravity CLI

```sh
git clone --depth 1 https://github.com/roc1103/visum-releases.git
agy plugin install ./visum-releases/plugins/visum-antigravity
```

If the repository is already checked out, run `git -C visum-releases pull --ff-only` instead of cloning it again. Restart `agy`, run `/skills` to confirm Visum is present, then type `/visum` or ask Antigravity to enter Visum Mode.

To update it, pull the repository, uninstall the old plugin and install the same wrapper again:

```sh
git -C visum-releases pull --ff-only
agy plugin uninstall visum
agy plugin install ./visum-releases/plugins/visum-antigravity
```

To remove it:

```sh
agy plugin uninstall visum
```

The official CLI documentation does not currently list a separate update command, so the explicit pull, uninstall and reinstall sequence above is the documented-safe refresh route.

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

**Ready now:** Yes, through the Visum Git marketplace. The separate Awesome Copilot listing was declined, but this does not disable direct installation.

**App:** Works in the GitHub Copilot app. Repository configuration also supports the Copilot cloud agent.

**CLI:** Works in GitHub Copilot CLI.

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

**Ready now:** Yes, as a Git extension.

**App:** No desktop route is claimed here.

**CLI:** Works in Gemini CLI. Run extension-management commands in the normal shell, not inside Gemini's interactive prompt.

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

**Ready now:** Yes, as a native global skill.

**App:** Works in desktop Cascade on the current machine.

**CLI:** No Windsurf CLI route is claimed here. Devin Local uses Devin's own repository-skill route below.

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

**Ready now:** Yes, as a repository skill. Devin's public plugin ecosystem is still closed beta.

**App:** Works in Devin cloud sessions and Devin Desktop/Local when the project repository contains the skill.

**CLI:** Works in Devin CLI when that repository is attached. Devin has no general user-global skill directory, so this installation is per repository.

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

**Ready now:** Yes, as a native global skill.

**App:** Works in Cline IDE extensions.

**CLI:** Works in Cline CLI/TUI. Cline's global `~/.cline` configuration is shared across its applications on the same machine.

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

**Ready now:** Yes, by importing the public repository as a custom Power. Kiro's public-registry review remains pending.

**App:** Works in Kiro IDE.

**CLI:** Not claimed. Kiro's August 2026 pages expose CLI and Web tabs for Powers, but Visum has not verified those surfaces, so the instructions below deliberately cover only the IDE.

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

**Ready now:** Yes, as a native global skill.

**App:** Works in local OpenCode clients that use the standard OpenCode configuration.

**CLI:** Works in OpenCode CLI. Both routes discover the `~/.config/opencode/skills/visum` path used by this installer.

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
