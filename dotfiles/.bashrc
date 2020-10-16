#!/bin/sh

export SSH_AUTH_SOCK=/tmp/.ssh-socket
ssh-add -l > /dev/null
if [ $? = 2 ]; then
    rm -f $SSH_AUTH_SOCK
    echo Starting new ssh-agent...
    eval $(ssh-agent -a $SSH_AUTH_SOCK) > /dev/null
    ssh-add
fi

set -o vi
bind '"jk":vi-movement-mode'

alias gs='git status'
alias gpu="git push"
alias gpl="git pull"

alias gch='git checkout'
alias chdev="gch develop"
alias gdis='gch .'
alias gdisother='git checkout *.mat *.asset *.spriteatlas *.prefab'
alias gnuke='gch . & git clean -df'
alias gshow=ShowOldFile.sh
alias gsha='git rev-parse --short HEAD'
alias ghash='gsha | clip.exe'
alias gbhash='{ git branch | grep \*; gsha; } | clip.exe' 
alias gln='git log -1 --format="%s , sha: %h" | clip.exe'

alias sf="git flow feature start"
alias ff="git flow feature finish && git push"

alias gfo='git fetch origin'
alias fetchdev="git fetch origin develop:develop"
alias fetchall=FetchBranches.sh
alias mergedev='git merge origin/develop'
alias gres=ResolveConflict.sh
alias grest='gres --theirs'
alias gresm='gres --ours'

alias gx=gitx.sh # "*." "" $*
alias gxa="gx add"
alias gxc="gx checkout"
alias gxr="gx reset"
alias gxcm="gxc mat"
alias gxac="gxa cs"
alias cmt=cmt.sh
alias cscmt="gxac && cmt"
alias cmtBuildAndroid="git commit --allow-empty -m 'do /androidonly' && git push"
alias cmtBuildIos="git commit --allow-empty -m 'do /ios' && git push"
alias cmtBuild="git commit --allow-empty -m 'do /androidonly /ios' && git push"
alias chp="git fetch origin cherrypick:cherrypick && git checkout cherrypick"
alias chpp="git fetch origin cherrypickpendingmerge:cherrypickpendingmerge && git checkout cherrypickpendingmerge"

alias gd=gitd.sh # "*" "/*" $*
alias gda="gd add"
alias gdc="gd checkout"
alias gdr="gd reset"

alias gf=gitf.sh # "*/" ".*" $*
alias gfa="gf add"
alias gfc="gf checkout"
alias gfr="gf reset"

alias gstash="git stash save -u"

alias swf=swf.sh
alias swh=swh.sh

alias gitInit=gitInit.sh
alias gitDelete='git branch | grep -v "rico\|cherrypick\|cherrypick\|develop\|beta_local\|staging\|staging_hotfix\|staging_server_hotfix\|production" | xargs git branch -D'
# delete remove branches for reference
# git branch -r | grep rico | grep -v "12\|13\|14\|bulkbutton\|purchases" | grep -oP "(?<=origin\/).*" | xargs git push origin --delete --dry-run
alias startserver="START dotnet run --project ../Build/Build StartLocalServer"

alias runJob=runjob.sh

alias note='trello add-card -b "Riccardo" -l "Inbox" $1 -p bottom' #using https://travis-ci.org/mheap/trello-cli

# alias config='"C:\Program Files\Git\bin\git" --git-dir=$HOME/.myconf/ --work-tree=$HOME'

alias ydl="youtube-dl"
alias ydlmp3="youtube-dl --extract-audio --audio-format mp3"
alias potgen="cd ~/syncfiles/projects/generate_application_data/bin/Release && ./generate_application_data.exe"

alias gettwitchid="~/syncfiles/twitch/get_user_id.sh"
alias gettwitchdata="~/syncfiles/twitch/get_channel_data.sh"

alias todo='grep "\*\s\[\s\]" ~/vimwiki/*.md | sed "s/\/c\/Users\/Riccardo\/vimwiki\///" | gvim -'

alias codegen='python ".\syncfiles\projects\codegen\runner.py" -s'

alias copydoom='~/syncfiles/copydoomconfig.bat'

alias deltmp='C:/ClashOfStreamers/Tools/deltmp/deltmp.bat'

function isAncestor {
    git merge-base --is-ancestor $1 $2 && echo "Yes. $1 is an ancestor of $2" || echo "No. $1 is not an ancestor of $2"
}
