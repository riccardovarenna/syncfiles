#!/bin/sh

LC_ALL=en_US.utf8

[ -n "$1" ] || (printf "provide the last rev you reviewed as first arg\n" && exit 1) || exit 1
untracked=$(git status -zs | grep "??")
[ -z "$untracked" ] || (printf "clean untracked files first\n" && exit 1) || exit 1

develop=$(git branch --show-current | grep "^develop$")
[ -n "$develop" ] || (printf "checkout develop first\n" && exit 1) || exit 1

old_branch=$(git branch -l | grep "tmp/review-branch" | cut -c 3- )

[ -z "$old_branch" ] || (printf "deleting old review branch\n" && git branch -d "$old_branch")

git checkout -b tmp/review-branch

git merge "$1"
git status -zs | grep -zZ "^.U" | cut -z -c 4- | xargs --null -I {} sh -c "git checkout --theirs -- '{}'"
git add -- .
git commit -m "Create tmp review branch from $1"

printf "Created and checked out review branch, let the diffing commence\nhint: You want to diff with the head of the side branch now\n"
