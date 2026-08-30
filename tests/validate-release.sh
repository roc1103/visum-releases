#!/bin/sh
set -eu

visum_repository="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
visum_expected_version="$(tr -d '\n' < "$visum_repository/skills/visum/VERSION")"
visum_expected_cli_version="0.1.2"
visum_expected_license="Apache-2.0"

fail() {
    printf '%s\n' "FAIL: $*" >&2
    exit 1
}

pass() {
    printf '%s\n' "PASS: $*"
}

command -v jq >/dev/null 2>&1 || fail "jq is required"

for visum_json in \
    plugin.json \
    gemini-extension.json \
    .claude-plugin/marketplace.json \
    .agents/plugins/marketplace.json \
    .github/plugin/marketplace.json \
    plugins/visum-agent/plugin.json \
    plugins/visum-claude/.claude-plugin/plugin.json \
    plugins/visum-codex/.codex-plugin/plugin.json
do
    jq -e . "$visum_repository/$visum_json" >/dev/null || fail "invalid JSON: $visum_json"
done
pass "all manifests contain valid JSON"

for visum_versioned_json in \
    plugin.json \
    gemini-extension.json \
    plugins/visum-agent/plugin.json \
    plugins/visum-claude/.claude-plugin/plugin.json \
    plugins/visum-codex/.codex-plugin/plugin.json
do
    visum_manifest_version="$(jq -r '.version // empty' "$visum_repository/$visum_versioned_json")"
    [ "$visum_manifest_version" = "$visum_expected_version" ] || {
        fail "$visum_versioned_json is $visum_manifest_version; expected $visum_expected_version"
    }
done

visum_copilot_version="$(jq -r '.plugins[0].version // empty' "$visum_repository/.github/plugin/marketplace.json")"
[ "$visum_copilot_version" = "$visum_expected_version" ] || fail "Copilot marketplace version mismatch"
pass "all package versions are $visum_expected_version"

for visum_licensed_json in \
    plugin.json \
    plugins/visum-agent/plugin.json \
    plugins/visum-claude/.claude-plugin/plugin.json \
    plugins/visum-codex/.codex-plugin/plugin.json
do
    visum_manifest_license="$(jq -r '.license // empty' "$visum_repository/$visum_licensed_json")"
    [ "$visum_manifest_license" = "$visum_expected_license" ] || {
        fail "$visum_licensed_json licence is $visum_manifest_license; expected $visum_expected_license"
    }
done

visum_claude_license="$(jq -r '.plugins[0].license // empty' "$visum_repository/.claude-plugin/marketplace.json")"
[ "$visum_claude_license" = "$visum_expected_license" ] || fail "Claude marketplace licence mismatch"
visum_copilot_license="$(jq -r '.plugins[0].license // empty' "$visum_repository/.github/plugin/marketplace.json")"
[ "$visum_copilot_license" = "$visum_expected_license" ] || fail "Copilot marketplace licence mismatch"

[ -s "$visum_repository/LICENSE.txt" ] || fail "root licence is missing"
[ -s "$visum_repository/skills/visum/LICENSE.txt" ] || fail "distributed skill licence is missing"
cmp -s "$visum_repository/LICENSE.txt" "$visum_repository/skills/visum/LICENSE.txt" || {
    fail "root and distributed skill licence texts differ"
}
grep -q '^Apache License$' "$visum_repository/LICENSE.txt" || fail "licence is not Apache 2.0"
grep -q '^Version 2\.0, January 2004$' "$visum_repository/LICENSE.txt" || fail "Apache licence version is missing"
[ -s "$visum_repository/NOTICE.txt" ] || fail "Apache attribution notice is missing"
[ -s "$visum_repository/skills/visum/NOTICE.txt" ] || fail "distributed skill notice is missing"
cmp -s "$visum_repository/NOTICE.txt" "$visum_repository/skills/visum/NOTICE.txt" || {
    fail "root and distributed skill notices differ"
}
grep -q '^Visum AI Integration$' "$visum_repository/NOTICE.txt" || fail "notice does not identify the integration"
pass "all supported manifests and distributed packages carry Apache License 2.0"

for visum_wrapper in visum-agent visum-claude visum-codex; do
    diff -rq \
        "$visum_repository/skills/visum" \
        "$visum_repository/plugins/$visum_wrapper/skills/visum" >/dev/null || {
        fail "$visum_wrapper does not contain the canonical skill tree byte-for-byte"
    }
done
pass "all native wrappers contain the canonical skill tree byte-for-byte"

for visum_script in \
    install-claude-code-app.sh \
    install-native-skill.sh \
    skills/visum/scripts/install_agent_skill.sh \
    skills/visum/scripts/install_claude_code_app.sh \
    skills/visum/scripts/install_cli.sh \
    skills/visum/scripts/update.sh
do
    sh -n "$visum_repository/$visum_script" || fail "shell syntax: $visum_script"
done
pass "all shell scripts pass syntax validation"

grep -q "visum_release_version=\"$visum_expected_cli_version\"" \
    "$visum_repository/skills/visum/scripts/install_cli.sh" || {
    fail "AI Skill installer does not pin public CLI $visum_expected_cli_version"
}
grep -q "Visum-CLI-$visum_expected_cli_version.zip" \
    "$visum_repository/skills/visum/references/installation.md" || {
    fail "installation reference does not name public CLI $visum_expected_cli_version"
}
pass "AI Skill version is independent and pins the existing public CLI $visum_expected_cli_version"

grep -q '^name: visum$' "$visum_repository/skills/visum/SKILL.md" || fail "skill name is not visum"
grep -q '^description: .' "$visum_repository/skills/visum/SKILL.md" || fail "skill description is missing"
grep -q 'first line must be exactly `Visum Mode active\.`' "$visum_repository/skills/visum/SKILL.md" || {
    fail "exact Visum Mode activation token is not mandatory"
}
grep -q 'first line must be exactly `Exiting Visum Mode\.`' "$visum_repository/skills/visum/SKILL.md" || {
    fail "exact Visum Mode exit token is not mandatory"
}
grep -q 'ask exactly this before handling the other topic' "$visum_repository/skills/visum/SKILL.md" || {
    fail "exact unrelated-topic gate is not mandatory"
}
grep -q 'Roo Code (legacy only)' "$visum_repository/README.md" || fail "Roo Code is not marked legacy"
if grep -q 'Existing compatible installations remain supported' "$visum_repository/README.md"; then
    fail "obsolete Gemini individual-account claim remains"
fi
pass "release claims include current Roo and Gemini status"

visum_test_root="$(mktemp -d)"
cleanup() {
    find "$visum_test_root" -depth -delete
}
trap cleanup EXIT HUP INT TERM
mkdir -p "$visum_test_root/project"
mkdir -p "$visum_test_root/claude-project"

VISUM_SKILL_INSTALL_HOME="$visum_test_root/claude-project-home" \
    "$visum_repository/skills/visum/scripts/install_claude_code_app.sh" \
    --project "$visum_test_root/claude-project" >/dev/null

[ -s "$visum_test_root/claude-project/.claude/skills/visum/SKILL.md" ] || {
    fail "Claude Code web/desktop project skill installation failed"
}
[ ! -e "$visum_test_root/claude-project-home/.claude/skills/visum" ] || {
    fail "Claude project installation also wrote a user skill"
}
diff -rq \
    "$visum_repository/skills/visum" \
    "$visum_test_root/claude-project/.claude/skills/visum" >/dev/null || {
    fail "Claude project install differs from canonical skill"
}
pass "Claude Code web/desktop project installation stages the canonical repository skill"

VISUM_SKILL_INSTALL_HOME="$visum_test_root/claude-user-home" \
    "$visum_repository/skills/visum/scripts/install_claude_code_app.sh" \
    --user >/dev/null
[ -s "$visum_test_root/claude-user-home/.claude/skills/visum/SKILL.md" ] || {
    fail "Claude local user skill installation failed"
}
pass "Claude local user installation remains separate from project installation"

VISUM_SKILL_INSTALL_HOME="$visum_test_root/home" \
    "$visum_repository/skills/visum/scripts/install_agent_skill.sh" \
    --target all \
    --project "$visum_test_root/project" >/dev/null

for visum_installed_skill in \
    home/.claude/skills/visum \
    home/.agents/skills/visum \
    home/.cursor/skills/visum \
    home/.gemini/config/skills/visum \
    project/.github/skills/visum \
    home/.gemini/skills/visum \
    home/.codeium/windsurf/skills/visum \
    home/.cline/skills/visum \
    home/.kiro/skills/visum \
    home/.config/opencode/skills/visum
do
    [ -s "$visum_test_root/$visum_installed_skill/SKILL.md" ] || {
        fail "staged all-target install missing $visum_installed_skill"
    }
    diff -rq \
        "$visum_repository/skills/visum" \
        "$visum_test_root/$visum_installed_skill" >/dev/null || {
        fail "staged install differs from canonical skill: $visum_installed_skill"
    }
done

[ ! -e "$visum_test_root/home/.roo/skills/visum" ] || fail "legacy Roo installed by current all-target mode"
pass "all ten current native skill destinations stage byte-for-byte; legacy Roo is excluded"

[ -s "$visum_test_root/home/.claude/skills/visum/SKILL.md" ] || {
    fail "all-target installation no longer uses Claude user scope"
}
[ ! -e "$visum_test_root/project/.claude/skills/visum" ] || {
    fail "all-target installation unexpectedly changed Claude to project scope"
}
pass "all-target installation preserves Claude user scope and Copilot-only project semantics"

if VISUM_SKILL_INSTALL_HOME="$visum_test_root/home" \
    "$visum_repository/skills/visum/scripts/install_agent_skill.sh" \
    --target cline >/dev/null 2>&1
then
    fail "installer overwrote an existing Cline skill without --replace"
fi
pass "installer refuses replacement without explicit --replace"

VISUM_SKILL_INSTALL_HOME="$visum_test_root/home" \
    "$visum_repository/skills/visum/scripts/install_agent_skill.sh" \
    --target cline \
    --replace > "$visum_test_root/replace-output.txt"
grep -q 'Previous cline skill retained at:' "$visum_test_root/replace-output.txt" || {
    fail "replacement did not report a retained backup"
}
visum_retained_path="$(sed -n 's/^Previous cline skill retained at: //p' "$visum_test_root/replace-output.txt")"
[ -s "$visum_retained_path/SKILL.md" ] || fail "reported replacement backup is incomplete"
pass "explicit replacement retains and reports the previous skill"

VISUM_SKILL_INSTALL_HOME="$visum_test_root/legacy-home" \
    "$visum_repository/skills/visum/scripts/install_agent_skill.sh" \
    --target roo >/dev/null
[ -s "$visum_test_root/legacy-home/.roo/skills/visum/SKILL.md" ] || {
    fail "explicit legacy Roo installation failed"
}
pass "legacy Roo remains available only when explicitly selected"

VISUM_SKILL_INSTALL_HOME="$visum_test_root/home" \
    "$visum_repository/skills/visum/scripts/install_agent_skill.sh" \
    --target all \
    --project "$visum_test_root/project" \
    --remove >/dev/null

for visum_removed_skill in \
    home/.claude/skills/visum \
    home/.agents/skills/visum \
    home/.cursor/skills/visum \
    home/.gemini/config/skills/visum \
    project/.github/skills/visum \
    home/.gemini/skills/visum \
    home/.codeium/windsurf/skills/visum \
    home/.cline/skills/visum \
    home/.kiro/skills/visum \
    home/.config/opencode/skills/visum
do
    [ ! -e "$visum_test_root/$visum_removed_skill" ] || {
        fail "all-target removal retained $visum_removed_skill"
    }
done

VISUM_SKILL_INSTALL_HOME="$visum_test_root/legacy-home" \
    "$visum_repository/skills/visum/scripts/install_agent_skill.sh" \
    --target roo \
    --remove >/dev/null
[ ! -e "$visum_test_root/legacy-home/.roo/skills/visum" ] || fail "legacy Roo removal failed"
pass "all ten current targets and explicit legacy Roo remove only their exact Visum skill directory"

VISUM_SKILL_INSTALL_HOME="$visum_test_root/claude-project-home" \
    "$visum_repository/skills/visum/scripts/install_claude_code_app.sh" \
    --project "$visum_test_root/claude-project" \
    --remove >/dev/null
[ ! -e "$visum_test_root/claude-project/.claude/skills/visum" ] || {
    fail "Claude project skill removal failed"
}

VISUM_SKILL_INSTALL_HOME="$visum_test_root/claude-user-home" \
    "$visum_repository/skills/visum/scripts/install_claude_code_app.sh" \
    --user \
    --remove >/dev/null
[ ! -e "$visum_test_root/claude-user-home/.claude/skills/visum" ] || {
    fail "Claude user skill removal failed"
}
pass "Claude project and user removal stay isolated"

printf '%s\n' "Visum integration release validation passed."
