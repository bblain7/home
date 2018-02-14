# Home Developer Software Installer

This repository installs the following software on a baseline Debian Linux OS.

- Atom Editor
- Facebook Yarn
- Google Chrome
- HashiCorp Packer
- HashiCorp Vagrant
- NodeJS
- OpenJDK Java
- Oracle Virtualbox

# Prerequisites

- Debian Linux OS

# Usage

From a fresh installation of the operating system, perform the following commands to install git and checkout the project.

```
sudo apt install git -y
mkdir ~/git
cd ~/git
git clone https://github.com/bblain7/home.git
cd ~/git/home
```

The installation script installs Ansible then all the software can be installed via Ansible configuration.

```
sh install-software.sh
```

For a completely automated execution of the installation script, configure SSH keys for github.com.

https://help.github.com/articles/connecting-to-github-with-ssh/



# FIXME

I'm not sure why but the FGtatsuro.virtualbox fails the first time and has to be run twice. I think because the apt repo is not updating correctly. There is also a patch that I'm adding to the script so that it works with Ubuntu Zesty Zappas.

```
TASK [FGtatsuro.virtualbox : Run tasks on current environment] **************************************
included: /home/brian/git/home/ansible/roles/FGtatsuro.virtualbox/tasks/Debian.yml for localhost

TASK [FGtatsuro.virtualbox : Add key for the repository of VirtualBox] ******************************
skipping: [localhost]

TASK [FGtatsuro.virtualbox : Add key for the repository ov VirtualBox(latest distribution)] *********
changed: [localhost]

TASK [FGtatsuro.virtualbox : Add the repository of VirtualBox] **************************************
ok: [localhost]

TASK [FGtatsuro.virtualbox : Install VirtualBox] ****************************************************
fatal: [localhost]: FAILED! => {"changed": false, "failed": true, "msg": "No package matching 'virtualbox-5.1' is available"}
```

# TODO

* Add an ansible role for simple installs and customization
  * vim
    * https://github.com/manala/ansible-role-vim
  * pidgin
    * sudo apt install pidgin
    * create a new ansible role and combine with apps that are being removed
  * remove amazon http://www.bettertechtips.com/ubuntu/remove-amazon-ubuntu/
    * These would remove it manually:
      * sudo rm -f /usr/share/applications/ubuntu-amazon-default.desktop
      * sudo rm -f /usr/share/ubuntu-web-launchers/amazon-launcher
    * but it might be smarter to remove via gsettings? Would have to write a script to read the gsetting, then add/remove apps
      * gsettings get org.gnome.shell favorite-apps
      * gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'rhythmbox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'yelp.desktop', 'google-chrome.desktop', 'atom.desktop']"
  * add installed apps to favorites menu
    * 'org.gnome.Terminal.desktop'
  * remove unused apps: rythmbox, mahjongg, mines, sudoku, thunderbird, etc.
    * sudo apt remove rhythmbox
    * sudo apt remove aisleriot gnome-mahjongg gnome-mines gnome-sudoku
    * sudo apt remove thunderbird
  * install gtile?
* update patches
* add "export LC_COLLATE="C"" so that dotfiles are ordered at the top, make sure permanent env var
* install skype
  * https://github.com/mhalano/ansible-role-skypeforlinux
  * mhalano.skypeforlinux
* script to set git config (can this be done with ansible settings? chicken and egg)
  * git config --global user.email "bblain7@gmail.com"
  * git config --global user.name "Brian Blain"
  * git config --global core.editor "vim"
* is there a way to update atom config?
  * https://discuss.atom.io/t/left-tree-view-pane-how-to-hide-files/29622/2
  * https://discuss.atom.io/t/how-to-stop-atom-from-auto-closing-and-swallowing-braces-and-quotes/2566/7
  * Go through each beautify setting and turn on "format on save" https://atom.io/packages/atom-beautify
* potentially, reset the entire ubuntu desktop before performing any changes
  * http://www.omgubuntu.co.uk/2017/10/how-to-reset-ubuntu-desktop-to-default?utm_source=slideshow
