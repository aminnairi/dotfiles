#!/bin/env bash

ERROR_BECAUSE_NON_ROOT=1
ERROR_BECAUSE_NOT_ARCH_LINUX=2
ERROR_BECAUSE_ANSIBLE_INSTALLATION_FAILED=3
ERROR_BECAUSE_PLAYBOOK_INVALID_OR_NOT_FOUND=4

if [[ "$(id -u)" -ne 0 ]]
then
  echo "Please, run this script as root"
  exit $ERROR_BECAUSE_NON_ROOT
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

echo "Choose a configuration";

available_playbook_paths=$(ls ansible/*.yml)

for index in $(seq 1 ${#available_playbook_paths[@]})
do
  available_playbook_path="$(basename "${available_playbook_paths[$index - 1]}")"

  echo "$index - $available_playbook_path"
done

read -r -p "Choice: " index

choosen_playbook_path=${available_playbook_paths[$index - 1]}

if [[ -z $choosen_playbook_path ]]
then
  echo "Error: invalid index."
  exit $ERROR_BECAUSE_PLAYBOOK_INVALID_OR_NOT_FOUND
fi

echo "Installing needed Ansible packages..."

ANSIBLE_COLLECTIONS_PATH="$PWD/ansible/collections" ansible-galaxy collection install --collections-path ansible/collections --requirements-file ansible/galaxy/requirements.yml

echo "Done installing needed Ansible packages."
echo "Running choosen Ansible Playbook at $choosen_playbook_path..."

ansible-playbook --inventory localhost, --module-path ansible/collections "$choosen_playbook_path"

echo "Done running choosen Ansible Playbook. If this is your first installation, you might want to reboot in order for the settings to take effect."
