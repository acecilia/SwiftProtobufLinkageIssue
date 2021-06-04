#!/usr/bin/env bash

set -euo pipefail

function switch() {
    sed -E -i '' "s|.*# toreplace|      - framework: ${1}/Carthage/Build/SwiftProtobuf.xcframework # toreplace|g" "project.yml"
}

function make_binaries() {
    readonly DIRECTORY="${1}"
    readonly CARTHAGE_BINARY="${2}"

    cd "${DIRECTORY}"
    rm -rf "Cartfile.resolved"
    rm -rf "Carthage"
    ${CARTHAGE_BINARY} bootstrap --use-xcframeworks --no-use-binaries --platform iOS --cache-builds
}

function check_linkage_type() {
    file "${1}/Carthage/Build/SwiftProtobuf.xcframework/ios-arm64_armv7/SwiftProtobuf.framework/SwiftProtobuf"
}

"$@"
