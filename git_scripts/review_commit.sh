#!/bin/sh

# example
# log-codeowner "@Benj" "34bfd4d149d45fc3c79214d506468cfa8078d1d1" "origin/feature/leon/bugs" "Leon"# args:
# codeowner gitlab name (your name)
# last reviewed commit
# head of the branch to be reviewed
# [optional] author name regex (probably one of the output of "GitScripts/authors")
grep -e "$1" "CODEOWNERS" | cut -d " " -f1 | cut -c 2- | \
    xargs git log "$2..$3" --pretty=format:"%h" --no-merges --author="{$4:.*}" --