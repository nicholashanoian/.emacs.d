#Emacs configuration for running through bash on windows

## Dependencies:
### Windows:
VcXsrv - Windows X Server - google vcxsrv and use installer

### Bash:
Update packages: (takes a bit)
1. sudo apt update
2. sudo apt upgrade

To install emacs:
1. sudo add-apt-repository ppa:kelleyk/emacs
2. sudo apt update
3. sudo apt install emacs25
4. edit .bashrc
   possibly add: export LIBGL_ALWAYS_INDIRECT=1
   add: export OneDriveBash="/mnt/" + the filepath to OneDrive
   	i.e. ="/mnt/c/Users/Nick/OneDrive"

xfce4: for running a Desktop of Ubuntu
1. sudo apt install xfce4
2. edit .bashrc
   add: export DISPLAY=:0.0
   to end of file

texlive: (this takes a while)
1. sudo apt-get install texlive-full

Clone this repository to ~/.emacs.d


Set git username and email:
1. git config --global user.name "Nicholas Hanoian"
2. git config --global user.email "nicholashanoian@gmail.com"


Quick guide to magit:
open menu: C-x g
navigation: n = next line
	    p = previous line
1. stage or ignore files
   1. navigate to files with n and p
   2. hit s to stage (this means you want to commit the changes you made)
   3. hit i to ignore (don't track changes)
2. commit
   1. open menu
   2. press c (commit)
   3. press c again (commit)
   4. enter commit message
   5. C-c C-c
3. add origin
   1. open menu
   2. press M (remote)
   3. press a (add)
   4. enter origin (this is the name)
   5. enter URL
      i.e. https://github.com/nicholashanoian/.emacs.d
4. push
   1. open menu
   2. press P (push)
   3. press p (to origin/master)
   4. enter username and password