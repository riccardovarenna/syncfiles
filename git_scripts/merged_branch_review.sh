#!/bin/sh
parents=$(git log --pretty=%P -n 1 $1)
parent1=$(echo $parents | cut -d " " -f1)
parent2=$(echo $parents | cut -d " " -f2)
mergebase=$(git merge-base $parent1 $parent2)
branchname="tmp/review$RANDOM"
git branch $branchname $parent2
echo $mergebase | clip
echo "branchname $branchname"
echo "mergebase $mergebase"
