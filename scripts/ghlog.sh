#!/bin/bash

# Purpose: This snippet allows you to create a beautiful message for github's PR based on the history of your commits
# Usage: add this file to the globally available ones and run `ghlog NUMBER_OF_COMMITS`, e.g. `ghlog 5`

if [ -z "$1" ]; then
    echo "Please specify how many commits to log"
    exit 0
fi

PURPOSE="Purpose:\n---\nPLACEHOLDER. All the changes described in commit messages (below)\n"

(
    echo -e "$PURPOSE\nChanges (in chronological order):" && \
    echo "---" && \
    (
        git log -n $1 --first-parent --pretty=format:"- [%h] %s%n%b" --reverse | \
        grep "\S"
    )
) | pbcopy

echo "Git log for last $1 commits was copied"
