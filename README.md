# Desktop Software Installer

This repository installs the following software on my Ubuntu Desktop.

- Apache Maven
- Facebook Yarn
- GitHub Atom IDE
- Google Chrome
- Hashicorp Packer
- Hashicorp Vagrant
- JetBrains IntelliJ IDEA
- Joyent NodeJS
- Microsoft Skype
- Oracle OpenJDK
- PostgreSQL
- Slack
- Vim

# Usage

The installation script installs Ansible then all the software can be installed via Ansible configuration. Run the following script.

```
./install-ansible
```

When the Ansible installation is done, run the Ansible commands to install the rest of the software.

```
ansible-galaxy install -r requirements.yml
ansible-playbook playbooks/developer.yml --flush-cache -K
```

# Configurations

This section just contains a few helpful configurations that are not really worth automating at the moment.

## Atom

- https://discuss.atom.io/t/left-tree-view-pane-how-to-hide-files/29622/2
- https://discuss.atom.io/t/how-to-stop-atom-from-auto-closing-and-swallowing-braces-and-quotes/2566/7
- Go through each beautify setting and turn on "format on save" https://atom.io/packages/atom-beautify

## Git

Run the following commands to configure git for the first time. Replace the name and email with your own.

```
git config --global user.name "name"
git config --global user.email "email"
git config --global core.editor "vim"
git config --global remote.origin.prune true
```
