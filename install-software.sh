#!/bin/bash


#if [ $(/usr/bin/id -u) -ne 0 ]; then
#  echo "Not running as root"
#  exit
#fi

DIR=$( dirname "$( readlink -f "$0" )" )
cd ${DIR}

software_dir="${HOME}/software"


#
# Install Ansible
# -------------------------------------------------------------------

getAnsibleVersion() {
  echo "$( ansible --version | awk '/^ansible/ {print $2}' )"
}

ansible_version="$( getAnsibleVersion )"
if [ -z ${ansible_version} ]; then
  sudo apt-get install software-properties-common -y

  # Have to manually set this to the last distro until zesty is released by Ansible
  #apt-add-repository ppa:ansible/ansible -y
  sudo apt-add-repository 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu yakkety main'

  sudo apt-get update
  sudo apt-get install ansible -y

  ansible_version="$( getAnsibleVersion )"
  echo "${ansible_version}"

  if [ ! -z ${ansible_version} ]; then
    echo "Ansible ${ansible_version} successfully installed."
  else
    echo "Ansible was not installed."
    exit 1;
  fi
else
  echo "Ansible ${ansible_version} already installed."
fi

ansible --version || {
  echo "Failed to install Ansible.";
  exit 1;
}


#
# Apply patches
# -------------------------------------------------------------------

# Copy the vars/main.yml for FGtatsuro.virtualbox so that it works
# in Ubuntu Zesty Zappas
vars_dir="${DIR}/ansible/roles/FGtatsuro.virtualbox/vars"
sudo mkdir -p "${vars_dir}"
sudo cp -f "${DIR}/patches/FGtatsuro.virtualbox/main.yml" "${vars_dir}"

# Also to fix FGtatsuro, update the apt repos
sudo apt update


#
# Execute Ansible Playbooks
# -------------------------------------------------------------------


cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook playbooks/developer.yml
