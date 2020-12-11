#!/bin/sh

# first argument is the branch you want to review, best to use the remote version
# second argument is the commit where you left off of reviewing the last time
# example: code-review.sh origin/feature/rico/bugs ceaf86d5

LC_ALL=en_US.utf8

git branch -D tmp/review-branch

[ -n "$1" ] || (printf "provide the last rev you reviewed as first arg\n" && exit 1) || exit 1
untracked=$(git status -zs | grep "??")
[ -z "$untracked" ] || (printf "clean untracked files first\n" && exit 1) || exit 1

old_branch=$(git branch -l | grep "tmp/review-branch" | cut -c 3- )

[ -z "$old_branch" ] || (printf "deleting old review branch\n" && git branch -d "$old_branch")

common_ancestor=$(git merge-base "develop" "$1")
git checkout -b tmp/review-branch "$common_ancestor"

git merge "$2"
git status -zs | grep -zZ "^.U" | cut -z -c 4- | xargs --null -I {} sh -c "git checkout --theirs -- '{}'"
git add -- .
git commit -m "Create tmp review branch from $1"

printf "Created and checked out review branch, let the diffing commence\nhint: You want to diff with the head of the side branch now\n"
