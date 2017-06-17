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

#Prerequisites

- Debian Linux OS

# Usage

The installation script installs Ansible then all the software can be installed via Ansible configuration.

```
sudo sh install-software.sh
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
