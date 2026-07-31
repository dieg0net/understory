#!/usr/bin/env bash
set -euo pipefail

root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)

python -m json.tool "$root/palette.json" >/dev/null

for index in {0..17}; do
  token="understory${index}"
  count=$(grep -c "\"$token\"" "$root/palette.json")
  [[ "$count" -ge 1 ]] || {
    printf 'Missing canonical token: %s\n' "$token" >&2
    exit 1
  }
  grep -q -- "--understory-$index:" "$root/src/understory.css"
  grep -q -- "\$understory-$index:" "$root/src/understory.scss"
  grep -q -- "$token =" "$root/src/understory.toml"
  grep -q -- "$token:" "$root/src/understory.yaml"
done

duplicates=$(grep -oE '#[0-9A-F]{6}' "$root/palette.json" | sort | uniq -d)
[[ -z "$duplicates" ]] || {
  printf 'Duplicate canonical colors:\n%s\n' "$duplicates" >&2
  exit 1
}

printf 'Understory palette is consistent across canonical formats.\n'
