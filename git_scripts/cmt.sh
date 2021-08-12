#!/usr/bin/env bash

message=""
push=0
addAll=0
noEdit=0
amend=0
hash=0
for arg do
    case ${arg} in 
        -p|--push)
            push=1
            ;;
        -a)
			addAll=1
			;;
		-ap|-pa)
			addAll=1
			push=1
			;;
        -ne|--no-edit)
            noEdit=1
            ;;
        -am|--amend)
            amend=1
            ;;
        -h|--hash)
            hash=1
            ;;
        -ah|-ha)
			addAll=1
            hash=1
            ;;
		*)
            message=${arg}    
            ;;
    esac
    
done

one=1
if [[ $addAll -eq $one ]] 
then
	git add .
fi

if [[ $noEdit -eq $one ]] 
then
    if [[ $amend -eq $one ]] 
    then
        git commit --no-edit --amend
    else
        git commit --no-edit
    fi
else
    if [[ $amend -eq $one ]] 
    then
        git commit --amend
    else
        git commit -m "$message"
    fi
fi

if [[ $hash -eq $one ]] 
then
    commitHash=`git rev-parse --short HEAD`
    echo "$commitHash" | tr -d '\n' | clip.exe
    echo "Copied commit hash to clipboard: $commitHash" 
    git pull
    git push
fi

if [[ ${push} > 0 ]]
then
    git push    
fi
