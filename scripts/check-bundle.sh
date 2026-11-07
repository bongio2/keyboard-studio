#!/bin/bash
# Run after bundling to catch missing SwiftPM resources before installation.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP="${1:-$ROOT/build/Keyboard Studio.app}"

for target in KeyboardKit KeyboardStudioApp; do
  bundle="$APP/Contents/Resources/keyboard-studio_$target.bundle"
  if [ ! -d "$bundle" ]; then
    echo "Missing SwiftPM resource bundle: $bundle" >&2
    exit 1
  fi
done

echo "SwiftPM resource bundles are packaged in Contents/Resources"
