# How this repo was set up

originated from a blog post [https://www.wangzerui.com/2017/03/06/using-git-to-manage-system-configuration-files/](wangzerio)

1. create folder in home directory
2. git init
3. git config status.showUntrackedFiles no
4. git config core.worktree "../../"

# Alternative setup

originated from a post on HN [https://news.ycombinator.com/item?id=11070797](ycombinator)

1. git init --bare $HOME/.myconf
2. alias config='MyGitDir --git-dir=$HOME/.myconf/ --work-tree=$HOME'
3. config config status.showUntrackedFiles no

(MyGitDir is the full path to you git directory, in my case it was: "C:\Program Files\Git\bin\git")

after that you can call any git command, but instead of calling
'git status' you call 'config status'


if you want to keep using the config alias, make sure to add 2. to your .bashrc

if you want to sync your settings to another pc do:

1. git clone --separate-git-dir=$HOME/.myconf MyGithubRepoURL
2. move the cloned files outside of your myconf folder that was created into your home directory to override the dotfiles that are there

# How Firefox customization was done

Since 2020/01/09 with the latest Firefox update, this config broke ...

inspiration from [https://github.com/turing753/minimal-functional-fox](minimal-functional-fox)

to enable custom css for Firefox:
1. go to about:config in your browser
2. search for toolkit.legacyUserProfileCustomizations.stylesheets
3. set the setting to true

after downloading the files they need to go in the right directory, you can find the directory by 
1. in firefox settings |||
2. Help
3. Troubleshooting information
4. Profile Folder -> Open Folder

this is where you create a "chrome" folder if it doesn't exist already and paste in your css files
