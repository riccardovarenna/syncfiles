#!/usr/bin/env bash

gitcommand="$1"
filePath="./$2"

git checkout "$gitcommand" "$filePath"
git add "$filePath"
