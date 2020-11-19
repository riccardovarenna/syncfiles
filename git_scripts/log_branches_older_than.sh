#!/bin/sh

for k in $(git branch -r --sort=committerdate --remote --merged | grep -o -P "(?<=origin\/)[^ ]+"); do
  if [[ ! $(git log -1 --since='1 month ago' -s origin/$k) ]]; then
    echo $k
  fi
done
