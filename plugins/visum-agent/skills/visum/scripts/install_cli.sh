#!/bin/sh
set -eu

visum_release_version="0.1.10"
visum_archive_sha256="8168938340d8d1f74fe29c075c540b847cf2bb38c88099899d6224cb7f4a51c8"
visum_release_url="https://github.com/roc1103/visum-releases/releases/download/v${visum_release_version}/Visum-CLI-${visum_release_version}.zip"
visum_archive_path=""
visum_licences_accepted="no"
visum_skip_model_import="no"

usage() {
    printf '%s\n' "Usage: install_cli.sh --accept-licences [--archive /path/to/Visum-CLI-${visum_release_version}.zip] [--skip-model-import]"
}

while [ "$#" -gt 0 ]; do
    case "$1" in
        --accept-licences)
            visum_licences_accepted="yes"
            shift
            ;;
        --archive)
            [ "$#" -ge 2 ] || { usage >&2; exit 2; }
            visum_archive_path="$2"
            shift 2
            ;;
        --skip-model-import)
            visum_skip_model_import="yes"
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

if [ "$visum_licences_accepted" != "yes" ]; then
    printf '%s\n' "Installation requires the user to review and explicitly accept the bundled Visum Software Licence and RO-ER Model Licence." >&2
    printf '%s\n' "An AI agent must not pass --accept-licences on the user's behalf." >&2
    exit 3
fi

[ "$(uname -s)" = "Darwin" ] || {
    printf '%s\n' "Visum CLI ${visum_release_version} supports macOS only." >&2
    exit 4
}

[ "$(uname -m)" = "arm64" ] || {
    printf '%s\n' "Visum CLI ${visum_release_version} requires Apple Silicon. Intel support is deferred." >&2
    exit 4
}

visum_macos_major="$(/usr/bin/sw_vers -productVersion | /usr/bin/awk -F. '{print $1}')"
[ "$visum_macos_major" -ge 14 ] || {
    printf '%s\n' "Visum CLI ${visum_release_version} requires macOS 14 or later." >&2
    exit 4
}

visum_temp_root="$(mktemp -d "${TMPDIR:-/tmp}/visum-cli-install.XXXXXX")"
trap 'find "$visum_temp_root" -depth -delete' EXIT HUP INT TERM

if [ -z "$visum_archive_path" ]; then
    visum_archive_path="$visum_temp_root/Visum-CLI-${visum_release_version}.zip"
    /usr/bin/curl --fail --location --silent --show-error \
        "$visum_release_url" --output "$visum_archive_path"
fi

[ -f "$visum_archive_path" ] || {
    printf '%s\n' "Archive not found: $visum_archive_path" >&2
    exit 5
}

visum_actual_sha256="$(/usr/bin/shasum -a 256 "$visum_archive_path" | /usr/bin/awk '{print $1}')"
[ "$visum_actual_sha256" = "$visum_archive_sha256" ] || {
    printf '%s\n' "The Visum CLI archive checksum did not match the pinned public release." >&2
    exit 6
}

visum_extract_root="$visum_temp_root/extracted"
/bin/mkdir -p "$visum_extract_root"
/usr/bin/ditto -x -k "$visum_archive_path" "$visum_extract_root"

visum_payload_root="$visum_extract_root/Visum CLI"
[ -x "$visum_payload_root/bin/visum" ] || {
    printf '%s\n' "The verified archive did not contain the expected Visum CLI executable." >&2
    exit 7
}

visum_install_parent="${VISUM_CLI_INSTALL_PARENT:-$HOME/Library/Application Support/RO Company/Visum/CLI}"
visum_install_root="$visum_install_parent/$visum_release_version"
visum_user_bin="${VISUM_CLI_BIN_DIR:-$HOME/.local/bin}"
visum_link="$visum_user_bin/visum"

/bin/mkdir -p "$visum_install_parent" "$visum_user_bin"

if [ -e "$visum_install_root" ]; then
    [ -x "$visum_install_root/bin/visum" ] || {
        printf '%s\n' "An incomplete installation already exists at: $visum_install_root" >&2
        exit 8
    }
else
    /bin/mv "$visum_payload_root" "$visum_install_root"
fi

if [ -e "$visum_link" ] && [ ! -L "$visum_link" ]; then
    printf '%s\n' "Refusing to replace the existing non-symlink command: $visum_link" >&2
    exit 9
fi

/bin/ln -sfn "$visum_install_root/bin/visum" "$visum_link"

if [ "$visum_skip_model_import" != "yes" ]; then
    set -- "$visum_install_root"/share/visum/models/*.visumpack
    if [ -e "$1" ]; then
        "$visum_install_root/bin/visum" library add "$@" --json >/dev/null
    fi
fi

printf '%s\n' "Installed RO-ER Visum CLI ${visum_release_version}."
printf '%s\n' "Command: $visum_link"
case ":$PATH:" in
    *":$visum_user_bin:"*) ;;
    *) printf '%s\n' "Add this directory to PATH: $visum_user_bin" ;;
esac

"$visum_install_root/bin/visum" doctor --json
