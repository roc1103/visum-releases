# Visum AI Integration

This repository teaches supported AI coding agents how to operate Visum through one canonical `skills/visum` behaviour tree. Every integration gets the same guided Visum Mode, numbered choices, `y`/`n` replies, natural-language fallback, local CLI orchestration, update checks, diagnostics boundaries and Confector authority rules.

The integration is available for eleven current hosts. Some hosts install a plugin, some install an Agent Skill, and Gemini CLI installs an extension. Those are different packaging routes for the same Visum behaviour.

## What this installs

This repository installs the **Visum AI integration**: the guided conversation, numbered choices and commands that let an AI coding agent operate Visum correctly.

It does **not** install Visum Developer, Visum Player, Visum CLI, Visum Engine or the official base models. When a local operation is requested, Visum Mode checks for the separate Visum CLI and offers its normal installer if it is missing.

There are therefore two layers:

1. the AI app or terminal agent provides the conversation; and
2. Visum CLI and Visum Engine perform capture, teaching, training, testing, inference and authorised Confector actions on the Mac.

The current runtime layer requires Apple Silicon and macOS 14 or later. You can still install the conversational integration in a cloud agent or on another operating system, but it cannot see or control your Mac from there.

## Start here

Find the product and surface you actually use. Follow only that linked section; commands for one agent are not interchangeable with another agent's commands.

- **Terminal** means the normal macOS Terminal app, before launching an AI agent.
- **Agent prompt** means the chat or command prompt inside the named AI app or terminal agent.
- **App UI** means buttons and menus—no Terminal is needed for that route.

| Host | Desktop app or IDE | Terminal agent | Cloud or web | Easiest working route today | Public catalogue |
| --- | --- | --- | --- | --- | --- |
| [Claude](#claude-code) | Cowork and local Code: yes. Ordinary Chat: only after directory approval | Yes | Repository skill: yes; no local Mac control | App: add the Git marketplace. CLI: install the same plugin | Anthropic review pending |
| [OpenAI Codex](#openai-codex) | Yes | Yes | Repository skill: yes; no local Mac control | Install the Git-marketplace plugin once for the app and CLI | Universal-directory submission not completed |
| [Cursor](#cursor) | Yes | Yes, on the same computer | Project skill: yes; no local Mac control | Install one global skill for both local surfaces | Cursor Marketplace review pending |
| [Google Antigravity](#google-antigravity) | Yes: Antigravity 2.0 | Yes: `agy` | Not claimed | Install the desktop skill and CLI plugin separately | Direct installation |
| [GitHub Copilot](#github-copilot) | Yes | Yes | Repository plugin/skill: yes; no local Mac control | Add the Visum Git marketplace in the app or CLI | Direct marketplace works; separate listing declined |
| [Google Gemini CLI](#google-gemini-cli) | No | Yes | No | Install the Git extension | Direct Git distribution |
| [Windsurf / Cascade](#windsurf--cascade) | Yes | No separate CLI route | Project skill can travel with a repository | Install one global skill | Direct skill distribution |
| [Devin](#devin) | Devin Local/Desktop: yes | Yes | Repository skill: yes; no local Mac control in cloud | Commit one skill to the repository Devin opens | Direct repository distribution |
| [Cline](#cline) | Yes | Yes | Project skill can travel with a repository | Install one global skill for IDE and CLI | Direct skill distribution |
| [Kiro](#kiro) | Yes | Yes | Workspace skill: yes; no local Mac control | IDE import is simplest; global skill covers local IDE and CLI | Kiro registry review pending |
| [OpenCode](#opencode) | Local clients: yes | Yes | Install separately on another host | Install one global skill | Direct skill distribution |

Marketplace status and every linked host instruction were last checked against official documentation on 1 September 2026.

### Verification status right now

- **Direct installation:** ready for 11 of 11 current hosts.
- **Lifecycle harness:** all 11 pass isolated installation, deterministic Visum Mode behaviour, update checking and removal tests.
- **Live host test:** Codex and Cursor pass in the real installed products on this Mac.
- **Partial live host test:** GitHub Copilot CLI installs and detects `visum@visum` 0.1.9, but this account's Copilot policy blocks the model session before Visum Mode starts.
- **Not yet live-tested here:** the remaining eight packages have passed the lifecycle harness, not a real session in every third-party app.
- **Public catalogue:** Claude, Cursor and Kiro remain under external review. Visum is not currently searchable in those public catalogues. OpenAI's optional universal-directory submission is incomplete. GitHub declined the separate Awesome Copilot listing, but GitHub's independent Visum marketplace remains installable.

So the short answer is: **all eleven have a working direct-install route, but all eleven are not yet publicly listed and live-tested.**

## Package names used below

- A **plugin** is a host-specific package containing the Visum skill. Claude Code, Codex, Antigravity CLI and GitHub Copilot have plugin routes.
- An **Agent Skill** is the `SKILL.md` behaviour plus its references and scripts. Cursor, Antigravity desktop, Windsurf, Devin, Cline and OpenCode can load it directly.
- A **Gemini extension** packages that same skill for Gemini CLI.
- A **Kiro Power** imports the portable root Agent Plugin.

All routes load the same Visum Mode behaviour. They do not replace the local Visum CLI or Engine.

## Why some sections use Git and others do not

Claude, Codex and GitHub Copilot can add this repository as a plugin marketplace. Gemini CLI can install it as an extension. Other products currently use the standard skill files directly, so their installer first downloads this public repository with Git.

Every section includes a complete copy-and-paste block. You do not need to run the common commands below separately; they are shown only to explain what the longer blocks do.

```sh
git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
cd "$HOME/visum-releases"
```

If the `visum-releases` folder already exists, update it instead:

```sh
git -C "$HOME/visum-releases" pull --ff-only
cd "$HOME/visum-releases"
```

Keep that Terminal in the `visum-releases` folder while running the agent-specific command. The installer refuses to overwrite an existing Visum skill unless `--replace` is supplied. When replacement is authorised, it retains the previous copy and prints its backup location.

## Claude Code

**Ready now:** Yes, by direct install in Cowork, local Code and Claude Code CLI. Anthropic's public-directory review is still pending. Claude plugins require a paid Claude plan, but Visum does not charge a separate integration fee.

**App or CLI?** Both. The Claude Desktop plugin browser covers Cowork and local Code. Claude Code CLI uses the same marketplace package. Ordinary Claude Chat needs the pending public-directory listing and is not the direct route today.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Claude Desktop or web, ordinary **Chat** | Not through the pending direct route yet | The same plugin will work here after Anthropic publishes it in the public directory |
| Claude Desktop, **Cowork** | Yes | Add the Visum Git marketplace in **Customize → Plugins** |
| Claude Desktop, local **Code** session | Yes | Claude plugin or personal skill |
| Claude Code CLI | Yes | The same Claude plugin |
| Claude Desktop SSH session | Yes | Install the plugin or skill on the SSH host |
| Claude remote/cloud Code session | Guided behaviour only | Commit a repository skill; plugins are unavailable in remote sessions |

**Recommended:** app users should use Option A. Terminal users should use Option B. Remote/cloud Code users should use Option D. Do not paste plugin commands into ordinary Claude Chat.

**Where commands go:** Option A is entirely inside Claude Desktop. Option B's `claude plugin ...` commands go in the normal macOS Terminal, before opening a Claude session. Option D's commands go in a Terminal opened at the repository Claude will work on.

### Option A — Claude Desktop app, no Terminal required

1. Open Claude Desktop, choose **Cowork**, then select **Customize → Plugins**. For a local **Code** session, use **+ → Plugins** instead.
2. Choose **Add marketplace**.
3. Enter `roc1103/visum-releases` and add it.
4. Find **Visum**, choose **Install**, then start a new Cowork or local Code session.
5. Type `/visum:visum` or ask Claude to enter Visum Mode.

This direct custom-marketplace route is for Cowork and local/SSH Code. It is not the current Visum route for ordinary Chat. Claude's plugin browser is unavailable in cloud Code sessions, and a plugin installed locally is not copied to them automatically; use Option D for a dependable repository-contained Visum skill.

**Check it worked:** return to **Customize → Plugins** or **+ → Plugins → Manage plugins** and confirm `visum` is installed and enabled. Then start a new session and type `/visum:visum`.

### Option B — Claude Code CLI and local Desktop Code, using Terminal

Run these commands in a normal Terminal. They are non-interactive CLI commands, so do **not** first launch `claude`:

```sh
claude plugin marketplace add roc1103/visum-releases
claude plugin install visum@visum
```

Start a new Claude Code CLI or local Desktop Code session. Type `/visum:visum` or ask Claude to enter Visum Mode. Claude Desktop and Claude Code CLI share local configuration, so this is one installation per user account on that computer.

**Check it worked:** run `claude plugin list` in Terminal and confirm `visum@visum` is enabled. In Desktop, open **+ → Plugins → Manage plugins** and confirm Visum is enabled.

If an older Claude Code build does not recognise the non-interactive `claude plugin` command, update Claude Code. Its interactive equivalent is to launch `claude` and enter `/plugin marketplace add roc1103/visum-releases`, then `/plugin install visum@visum` at Claude's prompt.

### Option C — Standalone personal skill for local Desktop Code

In a normal macOS **Terminal**, install the personal skill for all local Claude Desktop projects:

```sh
curl -fsSL https://raw.githubusercontent.com/roc1103/visum-releases/v0.1.9/install-claude-code-app.sh | sh -s -- --user
```

Restart the local Code session. Type `/` or use **+ → Slash commands**, then choose `visum`; asking Claude to enter Visum Mode also works. This route does not require a marketplace or plugin command, but it does not add Visum to Cowork.

**Check it worked:** open **+ → Slash commands** and confirm `visum` appears. This personal skill is available to local projects for that macOS user; it is not automatically copied into cloud sessions.

For an SSH Code session, run the same installer on the remote Mac or Linux host. Claude Desktop reads `~/.claude/skills/` from the SSH host, not from your local Mac.

### Option D — Claude remote/cloud Code sessions

In a normal **Terminal**, from the repository that Claude will open:

```sh
curl -fsSL https://raw.githubusercontent.com/roc1103/visum-releases/v0.1.9/install-claude-code-app.sh | sh -s -- --project "$PWD"
git add .claude/skills/visum
git commit -m "Add Visum skill"
```

Push that commit. Claude will discover the skill when it opens the repository. Cloud sessions can use the guided behaviour and repository files, but they cannot run the macOS-only Visum Engine on the user's computer.

**Check it worked:** open that repository in a new cloud Code session, type `/`, and confirm `visum` appears.

This repository-skill route supplies Visum Mode in the cloud. It does not install the local Visum CLI or connect the cloud session to the user's Mac. Anthropic also documents account-synced or repository-declared plugins for cloud sessions, but the committed skill above is the simplest Visum route while the public listing is pending.

### Update, remove or troubleshoot

- Plugin: open `/plugin` → **Marketplaces** → `visum` and enable auto-update. To refresh immediately, run `/plugin marketplace update visum`; load an updated plugin after the notification with `/reload-plugins`, or start a new session. Third-party marketplace auto-update is off by default.
- Personal skill: rerun the `--user` installer with `--replace` after a new integration release.
- Project skill: rerun the `--project` installer with `--replace`, then commit the change.
- Remove the plugin: `/plugin uninstall visum@visum`.
- Remove the personal skill by rerunning the `--user` installer with `--remove`.
- Remove a project skill by rerunning the `--project` installer with `--remove`, then commit the deletion.
- If `/plugin` is unknown, update Claude Code or use the normal-Terminal commands in Option B. Do not type Claude Code plugin commands into ordinary Claude Chat.

Official references: [Claude Desktop skills, plugins and surface limits](https://code.claude.com/docs/en/desktop), [Claude marketplace installation and updates](https://code.claude.com/docs/en/discover-plugins), [Cowork custom-marketplace installation](https://claude.com/docs/cowork/guide/plugins), [Claude public-directory surfaces and submission](https://claude.com/docs/plugins/submit), [Claude plugin plan availability](https://support.claude.com/en/articles/13837440-use-plugins-in-claude).

## OpenAI Codex

**Ready now:** Yes, through the Visum Git marketplace. It is not yet in OpenAI's universal directory. The Git marketplace is enough for direct installation; the universal directory would add public discovery and one-click catalogue installation.

**App or CLI?** Both. One marketplace-plugin installation on a Mac is visible to the Codex desktop app and Codex CLI. The IDE extension can instead use the standalone skill, while a cloud task needs the skill committed to its repository.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Codex desktop app | Yes | Visum Git marketplace plugin |
| Codex CLI | Yes | The same local plugin installation |
| Codex IDE extension | Yes | Standalone global Agent Skill |
| Codex cloud task | Guided behaviour only | Commit a repository Agent Skill |

**Recommended:** use Option A if you use the Codex desktop app. Use Option B if you use Codex CLI or want one Terminal installation shared by the local desktop app and CLI. Use Option C only for the IDE extension, and Option D only for a cloud task.

**Where commands go:** Option A is inside a new Codex desktop task. Options B and C go in the normal macOS Terminal, not the Codex chat box. Option D goes in a Terminal opened at the repository the cloud task will use.

### Option A — Codex desktop app

1. Start a new Codex task and enter `/plugins`.
2. Choose **Add Marketplace** and enter `roc1103/visum-releases`.
3. Find **Visum**, choose **Install**, then start a new task.
4. Mention `$visum` or ask Codex to enter Visum Mode.

**Check it worked:** open `/plugins` again and confirm `visum@visum` is installed and enabled.

### Option B — Codex desktop app and CLI, using Terminal

Run these in a normal macOS Terminal, not in the Codex chat box:

```sh
codex plugin marketplace add roc1103/visum-releases
codex plugin add visum@visum
```

Close any existing Codex task and start a new desktop task or CLI session. Mention `$visum` or ask Codex to enter Visum Mode. You install once per Mac; you do not repeat the installation separately in the app.

**Check it worked:** run `codex plugin list` in Terminal and confirm `visum@visum` is installed and enabled. In the desktop app, start a new task and mention `$visum`.

### Option C — Codex IDE extension, using Terminal

Copy this complete block into a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh codex
```

Restart the IDE extension and mention `$visum` or ask Codex to enter Visum Mode. This route installs the skill at `~/.agents/skills/visum`; it does not install a marketplace plugin.

**Check it worked:** confirm `~/.agents/skills/visum/SKILL.md` exists, start a new IDE task and mention `$visum`.

### Option D — Codex cloud tasks

First clone or update this integration repository in a normal Terminal. Then, from the repository Codex cloud will open, copy the canonical skill and commit it:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
mkdir -p .agents/skills
test ! -e .agents/skills/visum || { echo "Visum skill already exists; inspect it before replacing it."; exit 1; }
cp -R "$HOME/visum-releases/skills/visum" .agents/skills/visum
git add .agents/skills/visum
git commit -m "Add Visum skill"
```

Push the commit before starting the cloud task. The cloud agent can follow Visum Mode and edit repository artifacts, but it cannot reach the Visum Engine on the user's Mac.

### Update, remove or troubleshoot

To update:

```sh
codex plugin marketplace upgrade visum
codex plugin add visum@visum
```

To remove:

```sh
codex plugin remove visum@visum
```

In Codex CLI, `/plugins` opens the plugin browser. If the desktop app was already open during installation or update, start a new task.

For the standalone IDE skill, update the checkout and rerun `./install-native-skill.sh codex --replace`; remove it with `./install-native-skill.sh codex --remove`. For a cloud repository skill, replace or delete `.agents/skills/visum` and commit the change.

Official references: [OpenAI plugins in ChatGPT and Codex](https://learn.chatgpt.com/docs/build-plugins), [OpenAI Agent Skills and supported Codex surfaces](https://learn.chatgpt.com/docs/build-skills), [OpenAI plugin skills](https://developers.openai.com/plugins/concepts/skills). OpenAI's current documentation confirms that standalone skills work in the desktop app, Codex CLI and IDE extension, while a published plugin is shared through the universal ChatGPT/Codex directory.

## Cursor

**Ready now:** Yes, through the native skill route. Cursor Marketplace review is still pending.

**App or CLI?** Both. Cursor desktop and Cursor CLI on the same computer read the same global Visum skill. Cloud Agents and remote workers do not receive that local folder, so use the repository route for them.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Cursor desktop | Yes | Global native skill |
| Cursor CLI | Yes | The same global native skill |
| Cursor Cloud Agent, remote SSH or worker | Yes, guided behaviour only unless the worker has Visum | Commit a project skill |
| Cursor Marketplace | Review pending | Do not wait for it; use the native skill |

**Recommended:** use the global skill below for Cursor desktop and Cursor CLI on this Mac. Use the project skill only when Cursor runs on another machine, in Cloud Agents or in a remote worker.

**Where commands go:** every command in this section goes in a normal Terminal. After installation, `/visum` goes in Cursor's Agent chat.

### Install for Cursor desktop and local CLI — Terminal

Until Cursor completes marketplace review, copy this complete block into a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
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

Replace `/absolute/path/to/visum-releases` with `$HOME/visum-releases` when using the standard checkout above, or with the actual checkout location. Push the commit before starting the remote agent. Cursor's global skill on your Mac is not copied automatically to Cloud Agents, SSH hosts or background workers.

### Marketplace route after public approval

Once Visum is publicly listed, users will be able to install it from **Customize → Plugins**. Until Cursor approves the listing, the native skill instructions above are the supported public route. Cursor's documented local-plugin folder is for developer testing, not the normal public installation path, so this guide does not ask end users to use it.

### Update, remove or troubleshoot

To update:

```sh
git -C "$HOME/visum-releases" pull --ff-only
cd "$HOME/visum-releases"
./install-native-skill.sh cursor --replace
```

To remove:

```sh
"$HOME/visum-releases/install-native-skill.sh" cursor --remove
```

Reload Cursor afterward. If an organisation disables local plugin imports, use the native skill route or ask its administrator to allow the reviewed marketplace listing.

Official references: [Cursor Agent Skills and global paths](https://cursor.com/docs/skills), [Cursor plugins and local testing](https://cursor.com/docs/plugins).

## Google Antigravity

**Ready now:** Yes, but the CLI and desktop use different packages and directories.

**App or CLI?** Both are supported, but one installation does not cover the other. Install the desktop skill for Antigravity 2.0, the plugin wrapper for `agy`, or both if you use both products.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Antigravity 2.0 desktop | Yes | Global Agent Skill |
| Antigravity CLI (`agy`) | Yes | Antigravity-specific plugin wrapper |
| Both on one Mac | Yes | Install both packages separately |
| Cloud/web | Not claimed here | — |

**Recommended:** install only the surface you use. If you use both Antigravity 2.0 and `agy`, run both installation sections: the CLI plugin does not install the desktop skill, and the desktop skill does not install the CLI plugin.

**Where commands go:** all installation commands go in a normal Terminal. `/skills` and `/visum` are entered only after starting `agy` or opening an Antigravity chat.

**Important:** do not point `agy` at this repository's root `plugin.json`. The root manifest is the portable Agent Plugin used by compatible hosts; `agy` requires the Antigravity-specific wrapper under `plugins/visum-antigravity`.

### Install for Antigravity CLI — normal Terminal

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
agy plugin install "$HOME/visum-releases/plugins/visum-antigravity"
```

Restart `agy`, run `/skills` to confirm Visum is present, then type `/visum` or ask Antigravity to enter Visum Mode.

**Check it worked:** run `agy plugin list` in Terminal and confirm `visum` is installed. Then start `agy`, run `/skills`, and confirm the Visum skill appears.

#### Update or remove the CLI plugin

To update it, pull the repository, uninstall the old plugin and install the same wrapper again:

```sh
git -C "$HOME/visum-releases" pull --ff-only
agy plugin uninstall visum
agy plugin install "$HOME/visum-releases/plugins/visum-antigravity"
```

To remove it:

```sh
agy plugin uninstall visum
```

The official CLI documentation does not currently list a separate update command, so the explicit pull, uninstall and reinstall sequence above is the documented-safe refresh route.

### Install for Antigravity 2.0 desktop — normal Terminal, then app

Copy this complete block into a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh antigravity
```

Restart Antigravity 2.0 and ask it to enter Visum Mode. This copies Visum to the documented global desktop skill path, `~/.gemini/config/skills/visum`.

**Check it worked:** start a new Antigravity project and ask it to list available skills or enter Visum Mode. The desktop skill and CLI plugin are separate; installing one does not install the other.

#### Update or remove the desktop skill

To update the desktop skill:

```sh
git -C "$HOME/visum-releases" pull --ff-only
cd "$HOME/visum-releases"
./install-native-skill.sh antigravity --replace
```

To remove it:

```sh
"$HOME/visum-releases/install-native-skill.sh" antigravity --remove
```

Official references: [Antigravity plugins and CLI commands](https://antigravity.google/docs/cli/plugins/), [Antigravity global skills](https://antigravity.google/docs/skills/).

## GitHub Copilot

**Ready now:** Yes, through the Visum Git marketplace. The separate Awesome Copilot listing was declined, but this does not disable direct installation.

**App or CLI?** Both. The GitHub Copilot app and Copilot CLI can use the same custom marketplace. A cloud agent needs repository configuration because it cannot inherit a plugin installed only on your Mac.

| Surface | Works now? | What to install |
| --- | --- | --- |
| GitHub Copilot app | Yes | Visum custom-marketplace plugin |
| GitHub Copilot CLI | Yes | Visum custom-marketplace plugin |
| Copilot cloud agent | Yes, guided behaviour only unless its environment has Visum | Commit the repository skill/configuration |

**Recommended:** use the app UI if you use the GitHub Copilot app. Use the Terminal commands if you use Copilot CLI. Use the repository route only for Copilot cloud agent.

**Where commands go:** the CLI installation commands go in a normal Terminal before starting Copilot. The app route is entirely inside **Customize → Plugins**. The cloud route goes in a Terminal opened at the target repository.

### Install for Copilot CLI — normal Terminal

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

First obtain or update the Visum integration checkout, then install the repository skill:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh copilot --project /absolute/path/to/repository
```

Commit and push `.github/skills/visum`. Open the pushed branch in a new cloud-agent session and ask Copilot to list its available skills or enter Visum Mode.

Replace `/absolute/path/to/repository` with the full path to the project Copilot will open, for example `/Users/me/Documents/MyProject`.

### Update, remove or troubleshoot

To update:

```sh
copilot plugin marketplace update visum
copilot plugin update visum
```

To remove:

```sh
copilot plugin uninstall visum
```

The first update command refreshes the marketplace catalogue. The second updates the installed plugin. Updating the marketplace alone does not update an installed plugin.

Official references: [About Copilot plugins and supported surfaces](https://docs.github.com/en/copilot/concepts/agents/about-plugins), [customising the Copilot app](https://docs.github.com/en/copilot/how-tos/github-copilot-app/customize-github-copilot-app), [installing Copilot CLI plugins](https://docs.github.com/en/copilot/how-tos/copilot-cli/customize-copilot/plugins-finding-installing).

The independent marketplace above passed GitHub's automated manifest, lint and installation checks. Its separate Awesome Copilot listing request was rejected because it did not fit that repository at the time; this does not disable direct installation from this repository. [Public submission record](https://github.com/github/awesome-copilot/issues/2867).

## Google Gemini CLI

**Ready now:** Yes, as a Git extension.

**App or CLI?** CLI only. This section is for the `gemini` terminal program; it does not install Visum into the Gemini website, mobile app or another Google AI surface.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Gemini CLI | Yes | Gemini extension from GitHub |
| Separate Gemini desktop app | No route claimed | — |
| Gemini web app | No route claimed | — |

**Important:** run `gemini extensions ...` management commands in a normal shell, not inside Gemini's interactive prompt. Restart Gemini after installing or updating so the new extension files are loaded.

**Recommended:** use the single extension command below. Gemini CLI is the only supported Gemini surface in this release; this does not install anything into the Gemini web or mobile app.

**Where commands go:** installation, verification, update and removal commands go in a normal Terminal. `/extensions list` is the only command below that may also be entered inside Gemini CLI after it starts.

### Install — Terminal

```sh
gemini extensions install https://github.com/roc1103/visum-releases --ref main --auto-update
```

Restart Gemini CLI, run `/extensions list` to confirm Visum is loaded, then ask it to enter Visum Mode.

**Check it worked:** run `gemini extensions list` in Terminal. Then start Gemini, run `/extensions list`, and confirm `visum` appears.

### Update or remove

To update immediately:

```sh
gemini extensions update visum
```

To remove:

```sh
gemini extensions uninstall visum
```

The `--auto-update` flag in the install command enables extension auto-updates. The explicit update command remains available when a user wants to refresh immediately.

Official reference: [Gemini CLI extension commands](https://github.com/google-gemini/gemini-cli/blob/main/docs/extensions/reference.md).

## Windsurf / Cascade

**Ready now:** Yes, as a native global skill.

**App or CLI?** Windsurf desktop only in this section. It installs a Cascade skill for all local Windsurf workspaces. Devin is a separate product with separate instructions in the next section.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Cascade in Windsurf | Yes | Global native skill |
| Separate Windsurf CLI | No route claimed | — |
| Cloud session | No global-skill route claimed | Use the separate Devin repository route where applicable |

**Recommended:** use the global skill below for Cascade in Windsurf. It is installed once for the current computer and becomes available in all local Windsurf workspaces.

**Where commands go:** installation, update and removal commands go in a normal Terminal. `@visum` goes in the Cascade chat box after the app reloads.

### Install for the desktop app — Terminal, then app

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh windsurf
```

Reload the app. Open the Cascade customisations menu and confirm Visum appears under **Skills**, then type `@visum` or ask Cascade to enter Visum Mode.

**Check it worked:** open Cascade's three-dot customisations menu, choose **Skills**, and confirm `visum` is listed. `@visum` explicitly activates it; a relevant natural-language request can also activate it automatically.

### Update or remove

To update:

```sh
git -C "$HOME/visum-releases" pull --ff-only
cd "$HOME/visum-releases"
./install-native-skill.sh windsurf --replace
```

To remove:

```sh
"$HOME/visum-releases/install-native-skill.sh" windsurf --remove
```

Windsurf documents the global `~/.codeium/windsurf/skills/` path, Cascade's Skills UI and explicit `@skill-name` invocation used above.

Official reference: [Cascade Skills, global paths and `@` invocation](https://docs.windsurf.com/windsurf/cascade/skills).

## Devin

**Ready now:** Yes, as a repository skill. This route does not require a Devin marketplace or a separate plugin installation.

**App, CLI or cloud?** All three can discover the same committed repository skill. Devin Local/Desktop can use the Visum runtime when it is actually running on the supported Mac; Devin cloud can follow Visum Mode and edit repository files but cannot reach the Mac's screen or local Engine.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Devin cloud | Yes, guided behaviour only | Commit the repository skill |
| Devin Desktop/Local | Yes | Commit the repository skill; local Visum requires macOS |
| Devin CLI | Yes | Commit the repository skill |
| Public marketplace | Not required | The repository skill is the supported route |

**Recommended:** use the repository skill below. It is the public, no-beta-access route and works wherever Devin opens that committed repository.

**Where commands go:** run the installation block in a normal Terminal. Replace the example repository path with the real local checkout that Devin is connected to. `@skills:visum` goes in a new Devin session after the commit is pushed.

### Install into a repository — Terminal

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh devin --project /absolute/path/to/repository
```

Commit and push `.agents/skills/visum`. Devin discovers it from the connected repository. Start explicitly with `@skills:visum`, or ask Devin to enter Visum Mode. A cloud Devin session can follow the workflow but cannot reach the Visum Engine on your Mac.

Replace `/absolute/path/to/repository` with the full path to the repository Devin will open, for example `/Users/me/Documents/MyProject`.

**Check it worked:** open a new Devin session connected to that repository and use `@skills:visum`. If it is not found, confirm the committed file `.agents/skills/visum/SKILL.md` is present on the branch Devin opened.

### Update or remove

To update:

```sh
git -C "$HOME/visum-releases" pull --ff-only
cd "$HOME/visum-releases"
./install-native-skill.sh devin --project /absolute/path/to/repository --replace
```

To remove:

```sh
"$HOME/visum-releases/install-native-skill.sh" devin --project /absolute/path/to/repository --remove
```

Commit the resulting repository change. Visum does not claim a Devin marketplace listing; the documented repository-skill route is sufficient.

Official reference: [Devin repository skills and `@skills:` invocation](https://docs.devin.ai/product-guides/skills).

## Cline

**Ready now:** Yes, as a native global skill.

**App or CLI?** Both. Cline's IDE extensions and Cline CLI/TUI share the same global configuration on a computer, including the global Visum skill.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Cline IDE extension | Yes | Global native skill |
| Cline CLI/TUI | Yes | The same global native skill |
| Hosted cloud agent | No route claimed | — |

**Recommended:** install the global skill once. Cline's IDE extension and local CLI/TUI read the same skill directory on that computer.

**Where commands go:** installation, update and removal commands go in a normal Terminal. `/visum` goes in Cline's chat after Cline restarts.

### Install for the IDE and CLI — Terminal

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh cline
```

Restart Cline. In the IDE, open the Skills tab from the scale icon and confirm `visum` is enabled; discovered skills are enabled by default, and the toggle lets you disable or re-enable one. Type `/visum` or ask Cline to enter Visum Mode. The same global skill is available in Cline CLI/TUI on that computer.

**Check it worked:** in the IDE, open the Skills tab from the scale icon and confirm `visum` is enabled. In the CLI/TUI, start a new session and ask Cline to list skills or enter Visum Mode.

### Update or remove

To update:

```sh
git -C "$HOME/visum-releases" pull --ff-only
cd "$HOME/visum-releases"
./install-native-skill.sh cline --replace
```

To remove:

```sh
"$HOME/visum-releases/install-native-skill.sh" cline --remove
```

Official references: [Cline Skills](https://docs.cline.bot/customization/skills), [shared Cline IDE and CLI configuration](https://docs.cline.bot/getting-started/config).

## Kiro

**Ready now:** Yes, as an Agent Skill or a custom Power. Kiro's public-registry review remains pending.

**App, CLI or cloud?** All are supported, but the storage scope matters. A global skill covers local Kiro IDE and CLI. A committed workspace skill also works in Kiro web and mobile. A custom Power is optional and is not required for Visum Mode.

| Surface | Works now? | What to install |
| --- | --- | --- |
| Kiro IDE | Yes | Import, global skill or workspace skill |
| Kiro CLI | Yes | Global or workspace skill |
| Kiro web/mobile | Yes, guided behaviour only | Commit a workspace skill |
| Kiro Power | Yes, optional | Import the repository as a custom Power |
| Public Kiro registry | Review pending | Direct routes still work |

**Recommended:** use Option A if you use Kiro IDE. Use Option B if you want one local installation shared by Kiro IDE and CLI. Use Option C only when the skill must travel with a repository into Kiro web or mobile. The optional Power route is not required for Visum Mode.

**Where commands go:** Option A is entirely inside Kiro IDE. Options B and C use a normal Terminal. `/visum` goes in Kiro chat only after the skill is installed or imported.

### Option A — Import in Kiro IDE

1. Open **Agent Steering & Skills** in the Kiro panel.
2. Choose **+ → Import a skill → GitHub**.
3. Enter `https://github.com/roc1103/visum-releases/tree/main/skills/visum`.
4. Import it, start a new session, type `/`, and choose `visum`.

**Check it worked:** `visum` appears in **Agent Steering & Skills** and in the `/` command list.

### Option B — Install for Kiro IDE and CLI on this Mac — Terminal

Copy this complete block into a normal Terminal:

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
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

Replace `/absolute/path/to/visum-releases` with `$HOME/visum-releases` when using the standard checkout above, or with the actual checkout location. Push the commit, then open that branch in Kiro web and invoke `/visum`. A global skill on your Mac does not travel to Kiro web/mobile; only the committed workspace skill does.

### Optional Power route

Use this only if you specifically want Kiro to manage Visum as a Power. The Agent Skill options above are simpler for Visum Mode. The repository root is also a valid Agent Plugin:

1. Open **Powers → Add Custom Power**.
2. Choose **Import power from GitHub**.
3. Enter `https://github.com/roc1103/visum-releases`.
4. Choose **Install**.

Kiro CLI 3 detects Powers installed through the IDE, and current Kiro documentation also lists Powers for web. This route is optional; users who only need Visum's guided behaviour can use the simpler Agent Skill route above. Kiro mobile does not currently install Powers, so use a committed workspace skill there.

### Update or remove

For the local native skill:

To update the local native skill:

```sh
git -C "$HOME/visum-releases" pull --ff-only
cd "$HOME/visum-releases"
./install-native-skill.sh kiro --replace
```

To remove it:

```sh
"$HOME/visum-releases/install-native-skill.sh" kiro --remove
```

For a repository skill, replace or delete `.kiro/skills/visum` and commit the change. For a Power, open **Powers → Visum → Check for updates**, or remove it from the same details screen.

Official references: [Kiro Agent Skills and surface support](https://kiro.dev/docs/skills/), [Kiro CLI skills](https://kiro.dev/docs/cli/skills/), [Kiro Power installation](https://kiro.dev/docs/powers/installation/).

## OpenCode

**Ready now:** Yes, as a native global skill.

**App or CLI?** Both local forms. OpenCode CLI/TUI and local web or IDE clients that use the same home directory see the same global skill. A hosted session or another computer needs its own installation or a committed project skill.

| Surface | Works now? | What to install |
| --- | --- | --- |
| OpenCode CLI/TUI | Yes | Global native skill |
| Local OpenCode web or IDE client using the same home directory | Yes | The same global native skill |
| Another computer or hosted environment | Not from this global install | Install there or commit a project skill |

**Recommended:** install the global skill once for local OpenCode clients on this computer. OpenCode has no separate Visum marketplace package in this release.

**Where commands go:** installation, update and removal commands go in a normal Terminal. After starting a new OpenCode session, ask it to enter Visum Mode; OpenCode loads the skill on demand.

### Install — Terminal

```sh
if git -C "$HOME/visum-releases" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$HOME/visum-releases" pull --ff-only
else
  git clone --depth 1 https://github.com/roc1103/visum-releases.git "$HOME/visum-releases"
fi
cd "$HOME/visum-releases"
./install-native-skill.sh opencode
```

Start a new OpenCode session and ask it to use the Visum skill or enter Visum Mode. OpenCode loads the full skill only when it is selected or relevant.

**Check it worked:** ask OpenCode to list available skills and confirm `visum` appears. If it does not, verify `~/.config/opencode/skills/visum/SKILL.md` exists and that the selected agent's `skill` permission is not disabled.

### Update or remove

To update:

```sh
git -C "$HOME/visum-releases" pull --ff-only
cd "$HOME/visum-releases"
./install-native-skill.sh opencode --replace
```

To remove:

```sh
"$HOME/visum-releases/install-native-skill.sh" opencode --remove
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
