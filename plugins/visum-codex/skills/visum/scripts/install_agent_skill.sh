#!/bin/sh
set -eu

visum_skill_root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
visum_target=""
visum_project=""
visum_replace="no"
visum_install_home="${VISUM_SKILL_INSTALL_HOME:-$HOME}"

usage() {
    printf '%s\n' "Usage: install_agent_skill.sh --target claude|codex|cursor|antigravity|copilot|gemini|windsurf|cline|kiro|roo|opencode|all [--project /path/to/repository] [--replace]"
}

while [ "$#" -gt 0 ]; do
    case "$1" in
        --target)
            [ "$#" -ge 2 ] || { usage >&2; exit 2; }
            visum_target="$2"
            shift 2
            ;;
        --project)
            [ "$#" -ge 2 ] || { usage >&2; exit 2; }
            visum_project="$2"
            shift 2
            ;;
        --replace)
            visum_replace="yes"
            shift
            ;;
        --help|-h)
            usage
            exit 0
            ;;
        *)
            printf '%s\n' "Unknown option: $1" >&2
            usage >&2
            exit 2
            ;;
    esac
done

case "$visum_target" in
    claude|codex|cursor|antigravity|copilot|gemini|windsurf|cline|kiro|roo|opencode|all) ;;
    *) usage >&2; exit 2 ;;
esac

[ -s "$visum_skill_root/SKILL.md" ] && [ -s "$visum_skill_root/VERSION" ] || {
    printf '%s\n' "The extracted Visum AI Skill is incomplete." >&2
    exit 3
}

if [ "$visum_target" = "copilot" ] || [ "$visum_target" = "all" ]; then
    [ -n "$visum_project" ] || {
        printf '%s\n' "GitHub Copilot installation requires --project /path/to/repository." >&2
        exit 4
    }
    [ -d "$visum_project" ] || {
        printf '%s\n' "Copilot repository directory not found: $visum_project" >&2
        exit 4
    }
    visum_project="$(CDPATH= cd -- "$visum_project" && pwd)"
fi

destination_for() {
    case "$1" in
        claude) printf '%s\n' "$visum_install_home/.claude/skills/visum" ;;
        codex) printf '%s\n' "$visum_install_home/.agents/skills/visum" ;;
        cursor) printf '%s\n' "$visum_install_home/.cursor/skills/visum" ;;
        antigravity) printf '%s\n' "$visum_install_home/.gemini/config/skills/visum" ;;
        copilot) printf '%s\n' "$visum_project/.github/skills/visum" ;;
        gemini) printf '%s\n' "$visum_install_home/.gemini/skills/visum" ;;
        windsurf) printf '%s\n' "$visum_install_home/.codeium/windsurf/skills/visum" ;;
        cline) printf '%s\n' "$visum_install_home/.cline/skills/visum" ;;
        kiro) printf '%s\n' "$visum_install_home/.kiro/skills/visum" ;;
        roo) printf '%s\n' "$visum_install_home/.roo/skills/visum" ;;
        opencode) printf '%s\n' "$visum_install_home/.config/opencode/skills/visum" ;;
    esac
}

check_destination() {
    visum_destination="$(destination_for "$1")"
    if [ -e "$visum_destination" ] && [ "$visum_replace" != "yes" ]; then
        printf '%s\n' "A Visum skill already exists for $1 at: $visum_destination" >&2
        printf '%s\n' "Nothing was replaced. Use --replace only with the user's authority." >&2
        exit 5
    fi
}

install_one() {
    visum_agent="$1"
    visum_destination="$(destination_for "$visum_agent")"
    visum_parent="$(dirname -- "$visum_destination")"
    /bin/mkdir -p "$visum_parent"
    visum_stage="$(mktemp -d "$visum_parent/.visum-install.XXXXXX")"
    /usr/bin/ditto --noextattr --noqtn "$visum_skill_root" "$visum_stage/visum"
    [ -s "$visum_stage/visum/SKILL.md" ] && [ -s "$visum_stage/visum/VERSION" ] || {
        printf '%s\n' "Staging the Visum skill for $visum_agent failed." >&2
        exit 6
    }
    if [ -e "$visum_destination" ]; then
        visum_backup_root="$(mktemp -d "$visum_parent/.visum-previous.XXXXXX")"
        /bin/mv "$visum_destination" "$visum_backup_root/visum"
        printf '%s\n' "Previous $visum_agent skill retained at: $visum_backup_root/visum"
    fi
    /bin/mv "$visum_stage/visum" "$visum_destination"
    /bin/rmdir "$visum_stage"
    printf '%s\n' "Installed Visum AI Skill for $visum_agent at: $visum_destination"
}

if [ "$visum_target" = "all" ]; then
    for visum_agent in claude codex cursor antigravity copilot gemini windsurf cline kiro roo opencode; do
        check_destination "$visum_agent"
    done
    for visum_agent in claude codex cursor antigravity copilot gemini windsurf cline kiro roo opencode; do
        install_one "$visum_agent"
    done
else
    check_destination "$visum_target"
    install_one "$visum_target"
fi
