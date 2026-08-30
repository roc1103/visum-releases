#!/bin/sh
set -eu

visum_skill_version="0.1.3"
visum_archive_sha256="614fee9d4cfb8180fa2e8622c017b4723b16a63d7b486364170fa85b2fcc6d78"
visum_archive=""
visum_scope=""
visum_project=""
visum_action=""

usage() {
    printf '%s\n' "Usage: install-claude-code-app.sh (--project /path/to/repository|--user) [--replace|--remove] [--archive /path/to/Visum-AI-Skill.zip]"
}

while [ "$#" -gt 0 ]; do
    case "$1" in
        --project)
            [ "$#" -ge 2 ] || { usage >&2; exit 2; }
            [ -z "$visum_scope" ] || { printf '%s\n' "Choose either --project or --user, not both." >&2; exit 2; }
            visum_scope="project"
            visum_project="$2"
            shift 2
            ;;
        --user)
            [ -z "$visum_scope" ] || { printf '%s\n' "Choose either --project or --user, not both." >&2; exit 2; }
            visum_scope="user"
            shift
            ;;
        --replace|--remove)
            [ -z "$visum_action" ] || { printf '%s\n' "Choose either --replace or --remove, not both." >&2; exit 2; }
            visum_action="$1"
            shift
            ;;
        --archive)
            [ "$#" -ge 2 ] || { usage >&2; exit 2; }
            visum_archive="$2"
            shift 2
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

[ -n "$visum_scope" ] || {
    printf '%s\n' "Choose --project for Claude Code web/desktop projects or --user for local Claude Code." >&2
    usage >&2
    exit 2
}

visum_stage="$(mktemp -d /tmp/visum-claude-code-app.XXXXXX)"
cleanup() {
    find "$visum_stage" -depth -delete
}
trap cleanup EXIT HUP INT TERM

if [ -z "$visum_archive" ]; then
    visum_archive="$visum_stage/Visum-AI-Skill-$visum_skill_version.zip"
    /usr/bin/curl --fail --silent --show-error --location \
        --proto '=https' --tlsv1.2 \
        "https://github.com/roc1103/visum-releases/releases/download/v$visum_skill_version/Visum-AI-Skill-$visum_skill_version.zip" \
        --output "$visum_archive"
fi

[ -s "$visum_archive" ] || {
    printf '%s\n' "Visum AI Skill archive not found: $visum_archive" >&2
    exit 3
}

visum_actual_sha256="$(/usr/bin/shasum -a 256 "$visum_archive" | /usr/bin/awk '{print $1}')"
[ "$visum_actual_sha256" = "$visum_archive_sha256" ] || {
    printf '%s\n' "Visum AI Skill archive verification failed." >&2
    printf '%s\n' "Expected: $visum_archive_sha256" >&2
    printf '%s\n' "Actual:   $visum_actual_sha256" >&2
    exit 3
}

visum_extract="$visum_stage/skill"
/bin/mkdir -p "$visum_extract"
/usr/bin/ditto -x -k "$visum_archive" "$visum_extract"
[ -x "$visum_extract/scripts/install_claude_code_app.sh" ] || {
    printf '%s\n' "The verified Visum AI Skill archive is incomplete." >&2
    exit 3
}

if [ "$visum_scope" = "project" ]; then
    if [ -n "$visum_action" ]; then
        "$visum_extract/scripts/install_claude_code_app.sh" --project "$visum_project" "$visum_action"
    else
        "$visum_extract/scripts/install_claude_code_app.sh" --project "$visum_project"
    fi
    if [ "$visum_action" != "--remove" ]; then
        printf '%s\n' "Commit .claude/skills/visum in that repository so Claude Code web/desktop cloud sessions receive it."
    fi
else
    if [ -n "$visum_action" ]; then
        "$visum_extract/scripts/install_claude_code_app.sh" --user "$visum_action"
    else
        "$visum_extract/scripts/install_claude_code_app.sh" --user
    fi
fi
