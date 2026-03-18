#!/usr/bin/env bash
# Enforce that SKILL.md files do not exceed 300 lines.
set -euo pipefail

MAX_LINES=300
failed=0

for file in "$@"; do
    [[ "$file" == */SKILL.md ]] || continue

    count=$(wc -l < "$file")

    if (( count > MAX_LINES )); then
        echo "FAIL $file: $count lines exceeds the $MAX_LINES line limit — extract content into supporting files"
        failed=1
    fi
done

exit $failed
