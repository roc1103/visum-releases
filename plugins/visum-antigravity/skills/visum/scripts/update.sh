#!/bin/sh
set -eu

visum_skill_root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

command -v visum >/dev/null 2>&1 || {
    printf '%s\n' "Visum CLI is required before the AI Skill can update." >&2
    exit 2
}

visum_skill_version="$(tr -d '\n' < "$visum_skill_root/VERSION")"
VISUM_AI_SKILL_VERSION="$visum_skill_version" visum update install ai-skill --destination "$visum_skill_root"
