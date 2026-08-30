#!/bin/sh
set -eu

visum_repository="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
visum_target="${1:-}"
shift || true

case "$visum_target" in
    windsurf|cline|roo|opencode) ;;
    *)
        printf '%s\n' "Usage: ./install-native-skill.sh windsurf|cline|roo|opencode [--replace]" >&2
        exit 64
        ;;
esac

exec "$visum_repository/skills/visum/scripts/install_agent_skill.sh" --target "$visum_target" "$@"

