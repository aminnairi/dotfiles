#!/bin/env bash

ERROR_BECAUSE_ROOT=1
ERROR_BECAUSE_NOT_ARCH_LINUX=2
ERROR_BECAUSE_ANSIBLE_INSTALLATION_FAILED=3
ERROR_BECAUSE_PLAYBOOK_INVALID_OR_NOT_FOUND=4

if [[ "$(id -u)" -eq 0 ]]
then
  echo "Please, run this script as user"
  exit $ERROR_BECAUSE_ROOT
fi

if [[ ! -x $(command -v pacman) ]]
then
  echo "Please, use this script with an Arch Linux operating system."
  exit $ERROR_BECAUSE_NOT_ARCH_LINUX
fi

if [[ ! -x "$(command -v ansible)" ]]
then
  echo "Ansible not found, installing..."
  if [[ ! "$(sudo pacman -Syy --noconfirm ansible)" ]]
    then

    echo "Installion failed."
    exit $ERROR_BECAUSE_ANSIBLE_INSTALLATION_FAILED
  fi
fi

choosen_playbook_path=$1

if [[ -z $choosen_playbook_path ]]
then
  echo "Choose a configuration";

  available_playbooks="$(ls ansible/*.yml)"
  available_playbook_paths=()

  for available_playbook in $available_playbooks
  do
    available_playbook_paths+=("$available_playbook")
  done

  available_playbook_paths_count=${#available_playbook_paths[@]}

  for ((index=0; index < available_playbook_paths_count; index++))
  do
    echo "$((index + 1)). $(basename "${available_playbook_paths[$index]}")"
  done

  read -r -p "Choice: " index

  choosen_playbook_path=${available_playbook_paths[$index - 1]}
fi

if [[ -z $choosen_playbook_path ]]
then
  echo "Error: invalid index."
  exit $ERROR_BECAUSE_PLAYBOOK_INVALID_OR_NOT_FOUND
fi

echo "Installing needed Ansible packages..."

ANSIBLE_COLLECTIONS_PATH="$PWD/ansible/collections" ansible-galaxy collection install --collections-path ansible/collections --requirements-file ansible/galaxy/requirements.yml

echo "Done installing needed Ansible packages."
echo "Running choosen Ansible Playbook at $choosen_playbook_path..."

ansible-playbook --inventory localhost, --ask-become-pass --module-path ansible/collections "$choosen_playbook_path"

echo "Done running choosen Ansible Playbook. If this is your first installation, you might want to reboot in order for the settings to take effect."
