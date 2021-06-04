#!/usr/bin/env bash

set -euo pipefail

xcconfig=$(mktemp /tmp/static.xcconfig.XXXXXX)
trap 'rm -f "$xcconfig"' INT TERM HUP EXIT

echo 'MACH_O_TYPE = staticlib' >> $xcconfig

export XCODE_XCCONFIG_FILE="$xcconfig"

readonly SCRIPTS_DIRECTORY="$(dirname $0)"
carthage $@
