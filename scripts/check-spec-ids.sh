#!/usr/bin/env bash
# Enforce that all requirement IDs across all spec.yaml files are unique.
# Avoids `declare -A`, which macOS ships too old a bash to support.
set -euo pipefail

duplicates=$(
    grep -rh '^[[:space:]]*id:' --include='spec.yaml' . |
        grep -o 'REQ-[A-Z0-9-]*' |
        sort |
        uniq -d
)

[[ -z "$duplicates" ]] && exit 0

while IFS= read -r id; do
    echo "FAIL duplicate requirement ID '$id' found in:"
    grep -rl "$id" --include='spec.yaml' . | sed 's/^/  /'
done <<<"$duplicates"

exit 1
