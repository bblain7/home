# Home Developer Software Installer

This repository installs the following software on a baseline Debian Linux OS.

- Atom Editor
- Facebook Yarn
- HashiCorp Packer
- HashiCorp Vagrant
- OpenJDK Java
- Oracle Virtualbox
- NodeJS

#Prerequisites

- Debian Linux OS

# Usage

This project has a couple scripts to install software on a new development machine.

First run:

```
sudo sh scripts/ansible.sh
```

Once Ansible is installed then all the software can be installed via Ansible configuration.

```
sudo sh install-software.sh
```
