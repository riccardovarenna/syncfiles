#!/bin/sh

for k in $(git branch -r --sort=committerdate --remote --merged | grep -o -P "(?<=origin\/)[^ ]+"); do
  if [[ ! $(git log -1 --since='3 month ago' -s origin/$k) ]]; then
    echo $k
  fi
done
