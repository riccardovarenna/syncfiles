# How this repo was set up
1. copy all your dotfiles from the root to your dotfile folder in the git repo
> mv ~/dotfilename ~\syncfiles\dotfiles\dotfilename
2. create hardlinks to those dotfiles like this
> mklink /H ~/dotfilename ~\syncfiles\dotfiles\dotfilename

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
