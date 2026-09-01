# Visum AI Integration

This repository teaches supported AI coding agents how to operate Visum through one canonical `skills/visum` behaviour tree. Every integration gets the same guided Visum Mode, numbered choices, `y`/`n` replies, natural-language fallback, local CLI orchestration, update checks, diagnostics boundaries and Confector authority rules.

The integration is available for eleven current hosts. Some hosts install a plugin, some install an Agent Skill, and Gemini CLI installs an extension. Those are different packaging routes for the same Visum behaviour.

## What this does — and what it does not install

The host AI conducts the conversation. The separate Visum CLI and Visum Engine perform capture, teaching, training, testing, inference and explicitly authorised Confector actions.

Installing this repository does **not** install Visum Developer, Visum Player, the Visum CLI, Visum Engine or the official base models. On a supported Mac, Visum Mode can guide the user through installing the Visum CLI before the first local operation. A cloud-hosted agent can discuss Visum and edit compatible repository files, but it cannot directly capture or control the user's Mac unless that host is connected to a local Mac session.

For actual capture, training, inference or Confector execution, the current Visum runtime requires Apple Silicon and macOS 14 or later. The conversational skill can still be installed on other systems, but it must report the local-runtime limitation instead of pretending an operation ran.

## Start here

Choose the row for the AI product you actually use, then follow only that product's section. Do not mix commands from different sections. Each section answers the same five questions in the same order: **where it works, where to type the install command, how to start Visum Mode, how to verify it, and how to update or remove it**.

The guide uses three command locations:

- **Terminal** means the normal macOS Terminal app, before launching an AI agent.
- **Agent prompt** means the interactive prompt inside the named AI CLI or app. Slash commands such as `/plugin` belong there only when the section explicitly says so.
- **App UI** means buttons or menus in the desktop or IDE application.

“Direct install ready” and “listed in a public marketplace” are different statuses. Every supported host below has a direct route now. A pending public listing only affects whether someone can discover Visum by searching that company's catalogue.

| Host | App / IDE | CLI / TUI | Cloud / web | Recommended route today | Public catalogue |
| --- | --- | --- | --- | --- | --- |
| [Claude Code](#claude-code) | Yes: Claude Desktop **Code** tab | Yes | Yes: repository skill | Plugin for CLI/local Code; repository skill for cloud | Anthropic review pending |
| [OpenAI Codex](#openai-codex) | Yes: Codex in the ChatGPT desktop app | Yes | Not claimed here | Visum Git marketplace | Not submitted to OpenAI's universal directory |
| [Cursor](#cursor) | Yes | Yes, on the same machine | Yes: repository skill | Native global or project skill | Cursor Marketplace review pending |
| [Google Antigravity](#google-antigravity) | Yes: Antigravity 2.0 | Yes: `agy` | Not claimed here | Install separately for app and CLI | Direct installation; no listing required |
| [GitHub Copilot](#github-copilot) | Yes: GitHub Copilot app | Yes | Yes: repository configuration | Visum Git marketplace for CLI; repository skill/configuration for app or cloud | Awesome Copilot listing declined; direct install remains available |
| [Google Gemini CLI](#google-gemini-cli) | No desktop-app route claimed | Yes | Not claimed here | Git extension | Direct Git distribution |
| [Windsurf / Cascade](#windsurf--cascade) | Yes: Cascade in Windsurf/Devin Desktop | No separate route claimed | No separate route claimed | Native global skill | Direct skill distribution |
| [Devin](#devin) | Yes: Devin Desktop/Local | Yes | Yes | Repository skill | Devin plugins are closed beta; no public listing claimed |
| [Cline](#cline) | Yes: Cline IDE extensions | Yes | Not claimed here | Native global skill | Direct skill distribution |
| [Kiro](#kiro) | Yes: Kiro IDE | Yes | Yes: workspace skill | Native global or project skill; optional Power | Kiro registry review pending |
| [OpenCode](#opencode) | Yes: local clients using standard OpenCode configuration | Yes | Not claimed by this global install | Native global skill | Direct skill distribution |

### What “ready now” means

- The package or skill can be installed directly without waiting for a marketplace review.
- The same canonical Visum behaviour is supplied to every host.
- Local Visum operations still require the separate macOS Visum CLI and Engine.
- A cloud agent can use the guided workflow and repository files, but it cannot capture or control a user's Mac unless the host is connected to that Mac.
- External review is still unfinished for the Claude, Cursor and Kiro public listings. The optional OpenAI universal-directory route was not submitted, and the separate Awesome Copilot listing was declined. None of those catalogue states disables the direct routes documented below.

Marketplace status was last checked on 1 September 2026.

### Verification status right now

- **11 of 11** integrations have a direct install package or native-skill route and pass isolated install, behaviour, update-check and removal tests.
- **Codex and Cursor** have also been exercised in the actual locally installed host on this Mac.
- The other nine have validated package structure and documented installation routes, but their unavailable third-party host UI was not pretended to have been live-tested here.
- Claude, Cursor and Kiro public-catalogue reviews remain pending. GitHub declined the separate Awesome Copilot catalogue submission, while its independent Git marketplace remains installable. OpenAI's optional universal-directory submission has not been made because its publisher-verification route requires a payment method.

This distinction matters: the integration files are ready for direct installation, but the entire eleven-host distribution programme is not finished until the remaining host tests and external reviews are resolved.

## What users install

- A **plugin** is a host-specific package containing the Visum skill. Claude Code, Codex, Antigravity CLI and GitHub Copilot have plugin routes.
- An **Agent Skill** is the `SKILL.md` behaviour plus its references and scripts. Cursor, Antigravity desktop, Windsurf, Devin, Cline and OpenCode can load it directly.
- A **Gemini extension** packages that same skill for Gemini CLI.
- A **Kiro Power** imports the portable root Agent Plugin.

All routes load the same Visum Mode behaviour. They do not replace the local Visum CLI or Engine.

## One-time setup for native-skill installs

Sections that use `./install-native-skill.sh` require a local checkout. Run this once in Terminal:

```sh
git clone --depth 1 https://github.com/roc1103/visum-releases.git
cd visum-releases
```

If the `visum-releases` folder already exists, update it instead:

```sh
git -C visum-releases pull --ff-only
cd visum-releases
```

Keep that Terminal in the `visum-releases` folder while running the agent-specific command. The installer refuses to overwrite an existing Visum skill unless `--replace` is supplied. When replacement is authorised, it retains the previous copy and prints its backup location.

## Claude Code

**Ready now:** Yes, by direct install. Anthropic's public-directory review is still pending.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Claude Desktop, **Code** tab, local session | Yes | Claude plugin or personal skill |
| Claude Code CLI | Yes | Claude plugin |
| Claude Desktop SSH session | Yes | Install on the remote host |
| Claude cloud Code session | Yes, guided behaviour only | Commit the repository skill |
| Ordinary Claude Chat/Cowork conversation | Not covered by this direct route | Wait for the public Anthropic listing |

**Choose one route:** use Option A for Claude Code CLI and local Code-tab sessions, Option B if you only want a local personal skill, or Option C for cloud Code sessions. Installing one route does not automatically install the others.

**Important:** `/plugin` commands are Claude Code commands. Type them inside an interactive Claude Code session, not in a normal shell and not in an ordinary Claude chat that is not a Code session.

### Option A — Plugin for Claude Code CLI and local Claude Desktop Code sessions

1. Open a normal Terminal and start the interactive Claude Code CLI with `claude`.
2. At Claude's prompt, run these three slash commands. Do not paste them into the normal shell:

```text
/plugin marketplace add roc1103/visum-releases
/plugin install visum@visum
/reload-plugins
```

3. In a new CLI session, start with `/visum:visum` or ask Claude to enter Visum Mode.
4. In Claude Desktop, open a **local Code** session, select **+ → Plugins → Add plugin**, choose the configured `visum` marketplace, and install `visum`. Start a new Code session afterward.

**Check it worked:** in the CLI, run `/plugin list` and confirm `visum@visum` is enabled. In Desktop, open **+ → Plugins → Manage plugins** and confirm Visum is enabled. If the CLI asks for a reload, run `/reload-plugins`; if it requests confirmation because the prompt cache will be refreshed, run `/reload-plugins --force`.

### Option B — Personal skill for local Claude Desktop Code sessions

In a normal macOS **Terminal**, install the personal skill for all local Claude Desktop projects:

```sh
curl -fsSL https://raw.githubusercontent.com/roc1103/visum-releases/v0.1.9/install-claude-code-app.sh | sh -s -- --user
```

Restart the local Code session. Type `/` or use **+ → Slash commands**, then choose `visum`; asking Claude to enter Visum Mode also works. This route does not require the `/plugin` command.

**Check it worked:** open **+ → Slash commands** and confirm `visum` appears. This personal skill is available to local projects for that macOS user; it is not automatically copied into cloud sessions.

For an SSH Code session, run the same installer on the remote Mac or Linux host. Claude Desktop reads `~/.claude/skills/` from the SSH host, not from your local Mac.

### Option C — Claude cloud Code sessions

In a normal **Terminal**, from the repository that Claude will open:

```sh
curl -fsSL https://raw.githubusercontent.com/roc1103/visum-releases/v0.1.9/install-claude-code-app.sh | sh -s -- --project "$PWD"
git add .claude/skills/visum
git commit -m "Add Visum skill"
```

Push that commit. Claude will discover the skill when it opens the repository. Cloud sessions can use the guided behaviour and repository files, but they cannot run the macOS-only Visum Engine on the user's computer.

**Check it worked:** open that repository in a new cloud Code session, type `/`, and confirm `visum` appears.

### Update, remove or troubleshoot

- Plugin: open `/plugin` → **Marketplaces** → `visum` and enable auto-update. To refresh immediately, run `/plugin marketplace update visum`; load an updated plugin after the notification with `/reload-plugins`, or start a new session. Third-party marketplace auto-update is off by default.
- Personal skill: rerun the `--user` installer with `--replace` after a new integration release.
- Project skill: rerun the `--project` installer with `--replace`, then commit the change.
- Remove the plugin: `/plugin uninstall visum@visum`.
- Remove the personal skill by rerunning the `--user` installer with `--remove`.
- Remove a project skill by rerunning the `--project` installer with `--remove`, then commit the deletion.
- If `/plugin` is unknown, update Claude Code. In the desktop app, use the local-skill route above rather than typing `/plugin` into an ordinary chat.

Official references: [Claude Desktop skills, plugins and surface limits](https://code.claude.com/docs/en/desktop), [Claude marketplace installation and updates](https://code.claude.com/docs/en/discover-plugins).

## OpenAI Codex

**Ready now:** Yes, through the Visum Git marketplace. It is not yet in OpenAI's universal directory.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Codex in the ChatGPT desktop app | Yes | Visum Git marketplace plugin |
| Codex CLI | Yes | The same local plugin installation |
| Codex IDE extension | No plugin support | Use the app or CLI instead |
| Codex cloud | Not claimed by this guide | — |

**One installation serves both:** the marketplace and plugin are stored in the local Codex configuration used by the desktop app and CLI on that Mac.

### Install for both the desktop app and CLI — normal Terminal

Run these in a normal macOS Terminal, not in the Codex chat box:

```sh
codex plugin marketplace add roc1103/visum-releases
codex plugin add visum@visum
```

Close any existing Codex task and start a new desktop task or CLI session. Mention `$visum` or ask Codex to enter Visum Mode. You install once per Mac; you do not repeat the installation separately in the app.

**Check it worked:** run `codex plugin list` in Terminal and confirm `visum@visum` is installed and enabled. In the desktop app, start a new task and mention `$visum`.

### Update, remove or troubleshoot

```sh
# Update the marketplace snapshot and installed plugin
codex plugin marketplace upgrade visum
codex plugin add visum@visum

# Remove the installed plugin
codex plugin remove visum@visum
```

Run the two update commands together; run the remove command only when uninstalling. In Codex CLI, `/plugins` opens the plugin browser. If the desktop app was already open during installation or update, start a new task.

Official references: [OpenAI plugins in ChatGPT and Codex](https://learn.chatgpt.com/docs/plugins), [OpenAI Git and local marketplace packaging](https://developers.openai.com/plugins/build/plugins).

## Cursor

**Ready now:** Yes, through the native skill route. Cursor Marketplace review is still pending.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Cursor desktop | Yes | Global native skill |
| Cursor CLI | Yes | The same global native skill |
| Cursor Cloud Agent, remote SSH or worker | Yes, guided behaviour only unless the worker has Visum | Commit a project skill |
| Cursor Marketplace | Review pending | Do not wait for it; use the native skill |

**Choose one route:** use the global skill for the local desktop app and local CLI; use the project skill for cloud or remote agents.

### Install for Cursor desktop and local CLI — Terminal

Until Cursor completes marketplace review, install the native skill from a checkout:

```sh
./install-native-skill.sh cursor
```

Restart Cursor or run **Developer: Reload Window**. Open **Customize → Skills**, confirm `visum` is enabled, then use `/visum` or ask Cursor to enter Visum Mode. The global skill is also visible to Cursor CLI on the same account and machine.

**Check it worked:** in Cursor desktop, open **Customize → Skills** and confirm `visum` appears. In Cursor CLI, start a new session, type `/`, and confirm `visum` is listed.

### Install for Cursor Cloud Agents or remote workers — Terminal in the target repository

From the repository Cursor will open, copy the canonical skill into the project and commit it:

```sh
mkdir -p .cursor/skills
test ! -e .cursor/skills/visum || { echo "Visum skill already exists; inspect it before replacing it."; exit 1; }
cp -R /absolute/path/to/visum-releases/skills/visum .cursor/skills/visum
git add .cursor/skills/visum
git commit -m "Add Visum skill"
```

Replace `/absolute/path/to/visum-releases` with the checkout created in the one-time setup. Push the commit before starting the remote agent.

### Marketplace route after public approval

Once Visum is publicly listed, users will be able to install it from **Customize → Plugins**. Until Cursor approves the listing, the native skill instructions above are the supported public route. Cursor's documented local-plugin folder is for developer testing, not the normal public installation path, so this guide does not ask end users to use it.

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

| Surface | Works now? | What to install |
| --- | --- | --- |
| Antigravity 2.0 desktop | Yes | Global Agent Skill |
| Antigravity CLI (`agy`) | Yes | Antigravity-specific plugin wrapper |
| Both on one Mac | Yes | Install both packages separately |
| Cloud/web | Not claimed here | — |

**Choose one or both:** the CLI plugin does not install the desktop skill, and the desktop skill does not install the CLI plugin.

**Important:** do not point `agy` at this repository's root `plugin.json`. The root manifest is the portable Agent Plugin used by compatible hosts; `agy` requires the Antigravity-specific wrapper under `plugins/visum-antigravity`.

### Antigravity CLI — normal Terminal

```sh
git clone --depth 1 https://github.com/roc1103/visum-releases.git
agy plugin install ./visum-releases/plugins/visum-antigravity
```

If the repository is already checked out, run `git -C visum-releases pull --ff-only` instead of cloning it again. Restart `agy`, run `/skills` to confirm Visum is present, then type `/visum` or ask Antigravity to enter Visum Mode.

**Check it worked:** run `agy plugin list` in Terminal and confirm `visum` is installed. Then start `agy`, run `/skills`, and confirm the Visum skill appears.

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

### Antigravity 2.0 desktop — normal Terminal, then app

From a repository checkout:

```sh
./install-native-skill.sh antigravity
```

Restart Antigravity 2.0 and ask it to enter Visum Mode. This copies Visum to the documented global desktop skill path, `~/.gemini/config/skills/visum`.

**Check it worked:** start a new Antigravity project and ask it to list available skills or enter Visum Mode. The desktop skill and CLI plugin are separate; installing one does not install the other.

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

| Surface | Works now? | What to install |
| --- | --- | --- |
| GitHub Copilot app | Yes | Visum custom-marketplace plugin |
| GitHub Copilot CLI | Yes | Visum custom-marketplace plugin |
| Copilot cloud agent | Yes, guided behaviour only unless its environment has Visum | Commit the repository skill/configuration |

**Choose a route:** install the marketplace plugin for Copilot CLI, use the app's plugin UI for the Copilot app, or commit a repository skill for a cloud agent.

### Install for Copilot CLI — Terminal

```sh
copilot plugin marketplace add roc1103/visum-releases
copilot plugin install visum@visum
```

Ask Copilot to enter Visum Mode. In an interactive Copilot CLI session, the equivalent commands are available under `/plugin`.

**Check it worked:** run `copilot plugin list` and confirm `visum` is installed. Start a new Copilot session and ask it to enter Visum Mode.

### Install in the GitHub Copilot app — app UI only

1. Open **Customize → Plugins**.
2. Select the icon beside the marketplace dropdown and choose to add a custom marketplace.
3. Enter `roc1103/visum-releases` or `https://github.com/roc1103/visum-releases`.
4. Find `visum`, choose **Install**, then start a new session and ask Copilot to enter Visum Mode.

**Check it worked:** return to **Customize → Plugins** and confirm `visum` is installed and enabled.

### Install for Copilot cloud agent — Terminal in the target repository

Install the repository skill:

```sh
./install-native-skill.sh copilot --project /absolute/path/to/repository
```

Commit and push `.github/skills/visum`. Open the pushed branch in a new cloud-agent session and ask Copilot to list its available skills or enter Visum Mode.

### Update, remove or troubleshoot

```sh
# Refresh the marketplace, then update the installed plugin
copilot plugin marketplace update visum
copilot plugin update visum@visum

# Remove
copilot plugin uninstall visum
```

The first command refreshes the marketplace catalogue. The second updates the installed plugin. The third removes it. Updating the marketplace alone does not update an installed plugin.

Official references: [About Copilot plugins and supported surfaces](https://docs.github.com/en/copilot/concepts/agents/about-plugins), [customising the Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/customize-github-copilot-app), [installing Copilot CLI plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing).

The independent marketplace above passed GitHub's automated manifest, lint and installation checks. Its separate Awesome Copilot listing request was rejected because it did not fit that repository at the time; this does not disable direct installation from this repository. [Public submission record](https://github.com/github/awesome-copilot/issues/2867).

## Google Gemini CLI

**Ready now:** Yes, as a Git extension.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Gemini CLI | Yes | Gemini extension from GitHub |
| Separate Gemini desktop app | No route claimed | — |
| Gemini web app | No route claimed | — |

**Important:** run `gemini extensions ...` management commands in a normal shell, not inside Gemini's interactive prompt. Restart Gemini after installing or updating so the new extension files are loaded.

### Install — Terminal

```sh
gemini extensions install https://github.com/roc1103/visum-releases --ref main --auto-update
```

Restart Gemini CLI, run `/extensions list` to confirm Visum is loaded, then ask it to enter Visum Mode.

**Check it worked:** run `gemini extensions list` in Terminal. Then start Gemini, run `/extensions list`, and confirm `visum` appears.

### Update or remove

```sh
# Update
gemini extensions update visum

# Remove
gemini extensions uninstall visum
```

The `--auto-update` flag in the install command enables extension auto-updates. The explicit update command remains available when a user wants to refresh immediately.

Official reference: [Gemini CLI extension commands](https://github.com/google-gemini/gemini-cli/blob/main/docs/extensions/reference.md).

## Windsurf / Cascade

**Ready now:** Yes, as a native global skill.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Cascade in Windsurf/Devin Desktop | Yes | Global native skill |
| Separate Windsurf CLI | No route claimed | — |
| Cloud session | No global-skill route claimed | Use the separate Devin repository route where applicable |

### Install for the desktop app — Terminal, then app

```sh
./install-native-skill.sh windsurf
```

Reload the app. Open the Cascade customisations menu and confirm Visum appears under **Skills**, then type `@visum` or ask Cascade to enter Visum Mode.

**Check it worked:** open Cascade's three-dot customisations menu, choose **Skills**, and confirm `visum` is listed. `@visum` explicitly activates it; a relevant natural-language request can also activate it automatically.

### Update or remove

```sh
# Update
git pull --ff-only
./install-native-skill.sh windsurf --replace

# Remove
./install-native-skill.sh windsurf --remove
```

Windsurf's current documentation redirects this feature to Devin Desktop documentation; the global path and `@visum` invocation remain documented there.

Official reference: [Cascade Skills, global paths and `@` invocation](https://docs.windsurf.com/windsurf/cascade/skills).

## Devin

**Ready now:** Yes, as a repository skill. Devin's public plugin ecosystem is still closed beta.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Devin cloud | Yes, guided behaviour only | Commit the repository skill |
| Devin Desktop/Local | Yes | Commit the repository skill; local Visum requires macOS |
| Devin CLI | Yes | Commit the repository skill |
| Devin public plugin marketplace | No | Devin plugins are still closed beta |

### Install into a repository — Terminal

```sh
./install-native-skill.sh devin --project /absolute/path/to/repository
```

Commit and push `.agents/skills/visum`. Devin discovers it from the connected repository. Start explicitly with `@skills:visum`, or ask Devin to enter Visum Mode. A cloud Devin session can follow the workflow but cannot reach the Visum Engine on your Mac.

**Check it worked:** open a new Devin session connected to that repository and use `@skills:visum`. If it is not found, confirm the committed file `.agents/skills/visum/SKILL.md` is present on the branch Devin opened.

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

| Surface | Works now? | What to install |
| --- | --- | --- |
| Cline IDE extension | Yes | Global native skill |
| Cline CLI/TUI | Yes | The same global native skill |
| Hosted cloud agent | No route claimed | — |

### Install for the IDE and CLI — Terminal

```sh
./install-native-skill.sh cline
```

Restart Cline. In the IDE, open the Skills tab from the scale icon and confirm `visum` is enabled. Type `/visum` or ask Cline to enter Visum Mode. The same global skill is available in Cline CLI.

**Check it worked:** in the IDE, open the Skills tab from the scale icon and confirm `visum` is enabled. In the CLI/TUI, start a new session and ask Cline to list skills or enter Visum Mode.

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

**Ready now:** Yes, as an Agent Skill or a custom Power. Kiro's public-registry review remains pending.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Kiro IDE | Yes | Import, global skill or workspace skill |
| Kiro CLI | Yes | Global or workspace skill |
| Kiro web/mobile | Yes, guided behaviour only | Commit a workspace skill |
| Kiro Power | Yes, optional | Import the repository as a custom Power |
| Public Kiro registry | Review pending | Direct routes still work |

**Choose one route:** use Option A for the easiest IDE import, Option B for one local installation shared by Kiro IDE and CLI, or Option C for a repository that must also work in Kiro web/mobile.

### Option A — Import in Kiro IDE

1. Open **Agent Steering & Skills** in the Kiro panel.
2. Choose **+ → Import a skill → GitHub**.
3. Enter `https://github.com/roc1103/visum-releases/tree/main/skills/visum`.
4. Import it, start a new session, type `/`, and choose `visum`.

**Check it worked:** `visum` appears in **Agent Steering & Skills** and in the `/` command list.

### Option B — Install for Kiro IDE and CLI on this Mac — Terminal

From the `visum-releases` checkout created in the one-time setup:

```sh
./install-native-skill.sh kiro
```

Start a new Kiro IDE or Kiro CLI session. Type `/visum` or ask Kiro to enter Visum Mode.

**Check it worked:** in Kiro IDE, open **Agent Steering & Skills** and confirm `visum` appears. In Kiro CLI, run `/context show` or type `/` and confirm `visum` is listed.

### Option C — Install for Kiro web or a shared repository — Terminal

From the repository Kiro will open:

```sh
mkdir -p .kiro/skills
test ! -e .kiro/skills/visum || { echo "Visum skill already exists; inspect it before replacing it."; exit 1; }
cp -R /absolute/path/to/visum-releases/skills/visum .kiro/skills/visum
git add .kiro/skills/visum
git commit -m "Add Visum skill"
```

Replace `/absolute/path/to/visum-releases` with the checkout created in the one-time setup. Push the commit, then open that branch in Kiro web and invoke `/visum`.

### Optional Power route

Use this only if you specifically want Kiro to manage Visum as a Power. The Agent Skill options above are simpler for Visum Mode. The repository root is also a valid Agent Plugin:

1. Open **Powers → Add Custom Power**.
2. Choose **Import power from GitHub**.
3. Enter `https://github.com/roc1103/visum-releases`.
4. Choose **Install**.

Kiro CLI 3 can use Powers installed through the IDE. This route is optional; users who only need Visum's guided behaviour can use the simpler Agent Skill route above.

### Update or remove

For the local native skill:

```sh
# Update
git pull --ff-only
./install-native-skill.sh kiro --replace

# Remove
./install-native-skill.sh kiro --remove
```

For a repository skill, replace or delete `.kiro/skills/visum` and commit the change. For a Power, open **Powers → Visum → Check for updates**, or remove it from the same details screen.

Official references: [Kiro Agent Skills and surface support](https://kiro.dev/docs/skills/), [Kiro CLI skills](https://kiro.dev/docs/cli/skills/), [Kiro Power installation](https://kiro.dev/docs/powers/installation/).

## OpenCode

**Ready now:** Yes, as a native global skill.

| Surface | Works now? | What to install |
| --- | --- | --- |
| OpenCode CLI/TUI | Yes | Global native skill |
| Local OpenCode clients using standard config | Yes | The same global native skill |
| Hosted cloud environment | No global-install route claimed | Commit a project skill if that environment supports repository files |

### Install — Terminal

```sh
./install-native-skill.sh opencode
```

Start a new OpenCode session and ask it to use the Visum skill or enter Visum Mode. OpenCode loads the full skill only when it is selected or relevant.

**Check it worked:** ask OpenCode to list available skills and confirm `visum` appears. If it does not, verify `~/.config/opencode/skills/visum/SKILL.md` exists and that the selected agent's `skill` permission is not disabled.

### Update or remove

```sh
# Update
git pull --ff-only
./install-native-skill.sh opencode --replace

# Remove
./install-native-skill.sh opencode --remove
```

Official reference: [OpenCode Agent Skills and discovery paths](https://opencode.ai/docs/skills).

## Roo Code (legacy only)

Roo Code and its services shut down on 15 May 2026 and the source repository is archived. It is not a current supported target. The installer retains a legacy target only for historical installations:

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
