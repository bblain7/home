#!/bin/bash

cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook playbooks/developer.yml
