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
  apt-add-repository ppa:ansible/ansible -y
  #sudo apt-add-repository 'deb http://ppa.launchpad.net/ansible/ansible/ubuntu yakkety main'

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
#vars_dir="${DIR}/ansible/roles/FGtatsuro.virtualbox/vars"
#sudo mkdir -p "${vars_dir}"
#sudo cp -f "${DIR}/patches/FGtatsuro.virtualbox/vars/main.yml" "${vars_dir}"


# Chrome fails to update the cache. Have to change the task to a
# shell command.
#vars_dir="${DIR}/ansible/roles/cmprescott.chrome/tasks"
#sudo mkdir -p "${vars_dir}"
#sudo cp -f "${DIR}/patches/cmprescott.chrome/tasks/setup-apt.yml" "${vars_dir}"


# Update ownership for the roles directory since the copy is only
# giving permissions to root.
sudo chown -R "${USER}:${USER}" "${DIR}/ansible/roles"


# Also to fix FGtatsuro, clean and update the apt repos
sudo apt clean
sudo apt update


#
# Execute Ansible Playbooks
# -------------------------------------------------------------------

cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook playbooks/developer.yml --flush-cache



#
# Remove Amazon
# -------------------------------------------------------------------

# sudo rm -f /usr/share/applications/ubuntu-amazon-default.desktop
# sudo rm -f /usr/share/ubuntu-web-launchers/amazon-launcher

#
# gsettings get org.gnome.shell favorite-apps


#
# gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'rhythmbox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'yelp.desktop', 'google-chrome.desktop', 'atom.desktop']"

