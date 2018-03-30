# Emacs configuration for running through bash on windows

## Dependencies:
### Windows:
VcXsrv - Windows X Server - google vcxsrv and use installer

### Update Packages:
(takes a bit)

```shell
sudo apt update
sudo apt upgrade
```

### Installing emacs:

``` shell
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs25
```

#### Emacs Settings
You need to add the following lines to the end of ~/.bashrc

``` shell
export LIBGL_ALWAYS_INDIRECT=1
export DISPLAY=:0.0
export OneDriveBash="/mnt/PATH_TO_ONEDRIVE_ON_WINDOWS"
```
Example for declaring and assigning OneDriveBash:

``` shell-script
export OneDriveBash="/mnt/c/Users/Nick/OneDrive/"
```

### xfce4: 
Used for running a GUI Desktop of Ubuntu

``` shell
sudo apt install xfce4
```

### Tex Live
(this takes a while)

``` shell
sudo apt-get install texlive-full
```

### Getting emacs config
Clone this repository to home directory (i.e. ~/)

``` shell
cd ~
git clone https://github.com/nicholashanoian/.emacs.d
```

### Setting up git
Set git username and email:

``` shell
git config --global user.name "Nicholas Hanoian"
git config --global user.email "nicholashanoian@gmail.com"
```



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
