#!/usr/bin/env bash
# Enforce that all requirement IDs across all spec.yaml files are unique.
set -euo pipefail

failed=0
declare -A seen

while IFS= read -r line; do
    file=$(echo "$line" | cut -d: -f1)
    id=$(echo "$line" | grep -o 'REQ-[A-Z0-9-]*' | head -1)

    [[ -z "$id" ]] && continue

    if [[ -n "${seen[$id]:-}" ]]; then
        echo "FAIL duplicate requirement ID '$id' found in $file (first seen in ${seen[$id]})"
        failed=1
    else
        seen[$id]="$file"
    fi
done < <(grep -rn '^\s*id:' --include='spec.yaml' .)

exit $failed
