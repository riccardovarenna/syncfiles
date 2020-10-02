#!/usr/bin/env bash

message=""
push=0
addAll=0
noEdit=0
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
		*)
            message=${arg}    
            ;;
    esac
    
done

if [ "$addAll" = "1" ]; then
	git add .
fi

if [ "$noEdit" = "1" ]; then
    git commit --no-edit
else
    git commit -m "$message"
fi
    

if [[ ${push} > 0 ]]
then
    git push    
fi
