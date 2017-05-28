#!/bin/bash

# Installs Ansible

apt-get install software-properties-common -y

# Have to manually set this to the last distro until zesty is released by Ansible
#apt-add-repository ppa:ansible/ansible -y
apt-add-repository 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu yakkety main'

apt-get update
apt-get install ansible -y

ansible --version || {
  echo "Failed to install Ansible.";
}
