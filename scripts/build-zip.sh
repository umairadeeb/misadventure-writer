#!/usr/bin/env bash
# Builds dist/misadventure-writer.zip for upload to claude.ai.
# Includes only the public skill. Excludes any private voice/ folder and evals.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
name="misadventure-writer"
src="$root/skills/$name"
out="$root/dist"

mkdir -p "$out"
rm -f "$out/$name.zip"

cd "$root/skills"
zip -r "$out/$name.zip" "$name" \
  -x "$name/voice/*" \
  -x "$name/evals/*" \
  -x "*.DS_Store"

echo "Built $out/$name.zip"
echo "Contents check (should list no voice/ files):"
unzip -l "$out/$name.zip" | grep -E "/voice/" && { echo "ERROR: private voice files in zip" >&2; exit 1; } || echo "OK: no voice/ files."
