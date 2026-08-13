#!/usr/bin/env bash
# Enforce that all requirement IDs across all spec.yaml files are unique.
# Avoids `declare -A`, which macOS ships too old a bash to support.
set -euo pipefail

# Requirements are list entries, so the line reads "  - id: REQ-...".
# `|| true` keeps the empty case from tripping `set -e` on grep's exit 1.
duplicates=$(
    grep -rhE '^[[:space:]]*(-[[:space:]]*)?id:' --include='spec.yaml' . |
        grep -o 'REQ-[A-Z0-9-]*' |
        sort |
        uniq -d || true
)

if [[ -n "$duplicates" ]]; then
    while IFS= read -r id; do
        echo "FAIL duplicate requirement ID '$id' found in:"
        grep -rl "$id" --include='spec.yaml' . | sed 's/^/  /'
    done <<<"$duplicates"
    exit 1
fi

exit 0
