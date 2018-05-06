# Emacs configuration for running through bash on windows

### Preview Latex
Edit .emacs.d/elpa/auctex-*/prv-emacs.el
Change



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
For compiling LaTeX files (this takes a while).

``` shell
sudo apt-get install texlive-full
```

### Pandoc
For compiling markdown files.

``` shell
sudo apt-get install pandoc
```

### PDF Tools Prerequesites

``` shell
sudo apt-get install libpng-dev zlib1g-dev
sudo apt-get install libpoppler-glib-dev
sudo apt-get install libpoppler-private-dev
sudo apt-get install imagemagick
```
Then open emacs and run

``` shell
M-x pdf-tools-install
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

* open menu: C-x g
* navigation: 
 * n = next line
 * p = previous line
1. Stage or Ignore Files
   1. Navigate to files with n and p
   2. Hit s to stage (this means you want to commit the changes you made)
   3. Hit i to ignore (don't track changes)
2. Commit
   1. Open menu
   2. Press c (commit)
   3. Press c again (commit)
   4. Enter commit message
   5. C-c C-c
3. Add Origin
   1. Open menu
   2. Press M (remote)
   3. Press a (add)
   4. Enter origin (this is the name)
   5. Enter URL
     * i.e. https://github.com/nicholashanoian/.emacs.d
4. push
   1. open menu
   2. press P (push)
   3. press p (to origin/master)
   4. enter username and password
   
   
### Java - Eclim

#### 1. Installing jdk
Install java:
``` shell
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java9-set-default
```
Check that java is installed properly:

``` shell
java -version
javac -version
```

#### 2. Installing eclipse
Download installer from windows:
https://www.eclipse.org/downloads/download.php?file=/oomph/epp/oxygen/R2/eclipse-inst-linux64.tar.gz

Move to home directory on bash:

``` shell
mv eclipse-inst-linux64.tar.gz ~
```
Install eclipse:

``` shell
tar xf eclipse-inst-linux64.tar.gz
cd eclipse-installer
./eclipse-inst
```
Now use the installer. First open menu on left side and hit update. Then install and choose Eclipse IDE for Java Developers. Make sure paths are good.

Eclipse should now be installed in your home directory. Now move Eclipse to /opt:

``` shell
sudo mv -r /home/nick/eclipse /opt
```
Now add eclipse to the PATH variable so that it can be run from any location. Edit .bashrc (located in home directory) and add the following line to the end:

``` shell
export PATH=$PATH:/opt/eclipse/java-oxygen3/eclipse
```

#### 3. Installing eclim
Download eclim bin from eclim website:

``` shell
wget "https://github.com/ervandew/eclim/releases/download/2.7.2/eclim_2.7.2.bin"
```

