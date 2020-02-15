#!/usr/bin/env bash

filePath="./$1";
num=$2;
diff=$3;
dir=${filePath%/*} 
fileName=${filePath##*/}
tempFileName="old_$fileName";
tempFilePath="$dir/$tempFileName";

lines=$(git log --pretty=format:%H -- ${filePath}  | head -n 20);
commit=$(echo "$lines" | sed -n "${num}p");

git show "$commit:$filePath" > ${tempFilePath}
if [ -n "$diff" ]; then
    code --diff ${filePath} ${tempFilePath}
else
    code ${tempFilePath}
fi