#!/bin/sh

git fetch origin --prune
git fetch

branches=$(git branch | grep "[^\*] ")
remoteBranches=$(git branch -r)

echo "$branches" | while read -r branch;
do
    originBranch="origin/$branch"
    if [[ ${remoteBranches} = *"$originBranch"* ]] && git merge-base --is-ancestor "$branch" "$originBranch"; then
        git fetch origin "$branch:$branch"
    fi
done

git gc --prune=now
