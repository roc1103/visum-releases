#!/bin/sh
set -eu

visum_script_root="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
visum_scope=""
visum_project=""
visum_action=""

usage() {
    printf '%s\n' "Usage: install_claude_code_app.sh (--project /path/to/repository|--user) [--replace|--remove]"
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

if [ "$visum_scope" = "project" ]; then
    if [ -n "$visum_action" ]; then
        exec "$visum_script_root/install_agent_skill.sh" --target claude --project "$visum_project" "$visum_action"
    fi
    exec "$visum_script_root/install_agent_skill.sh" --target claude --project "$visum_project"
fi

if [ -n "$visum_action" ]; then
    exec "$visum_script_root/install_agent_skill.sh" --target claude "$visum_action"
fi
exec "$visum_script_root/install_agent_skill.sh" --target claude
