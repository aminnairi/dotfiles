#!/bin/env bash

function display_help() {
  first_playbook_found="$(find ansible -maxdepth 1 -type f -name '*.yml' | head -1 )"

  echo "Example usage for interactive mode:"
  echo "  bash $0"
  echo "Example usage for non-interactive mode:"
  echo "  bash $0 $first_playbook_found"
}

ERROR_BECAUSE_ROOT=1
ERROR_BECAUSE_NOT_ARCH_LINUX=2
ERROR_BECAUSE_TOO_MUCH_ARGUMENTS_PROVDED=3
ERROR_BECAUSE_ANSIBLE_INSTALLATION_FAILED=4
ERROR_BECAUSE_PLAYBOOK_INVALID_OR_NOT_FOUND=5
ERROR_BECAUSE_PLAYBOOK_PATH_DOES_NOT_EXIST=6

if [[ "$(id -u)" -eq 0 ]]
then
  echo "Please, run this script as user"
  display_help
  exit $ERROR_BECAUSE_ROOT
fi

if [[ ! -x $(command -v pacman) ]]
then
  echo "Please, use this script with an Arch Linux operating system."
  display_help
  exit $ERROR_BECAUSE_NOT_ARCH_LINUX
fi

if [[ ! -x "$(command -v ansible)" ]]
then
  echo "Ansible not found, installing..."
  if [[ ! "$(sudo pacman -Syy --noconfirm ansible)" ]]
    then

    echo "Installion failed."
    display_help
    exit $ERROR_BECAUSE_ANSIBLE_INSTALLATION_FAILED
  fi
fi

if [[ $# -gt 1 ]]
then
  echo "Too much arguments provided."
  display_help
  exit $ERROR_BECAUSE_TOO_MUCH_ARGUMENTS_PROVDED
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

  if [[ -z $choosen_playbook_path ]]
  then
    echo "Error: invalid index."
    display_help
    exit $ERROR_BECAUSE_PLAYBOOK_INVALID_OR_NOT_FOUND
  fi
fi

if [[ ! -f $choosen_playbook_path ]]
then
  echo "Error: playbook path $choosen_playbook_path does not exist on the file system."
  display_help
  exit $ERROR_BECAUSE_PLAYBOOK_PATH_DOES_NOT_EXIST
fi

echo "Installing needed Ansible packages..."

ANSIBLE_COLLECTIONS_PATH="$PWD/ansible/collections" ansible-galaxy collection install --collections-path ansible/collections --requirements-file ansible/galaxy/requirements.yml

echo "Done installing needed Ansible packages."
echo "Running choosen Ansible Playbook at $choosen_playbook_path..."

ansible-playbook --inventory localhost, --ask-become-pass --module-path ansible/collections "$choosen_playbook_path"

echo "Done running choosen Ansible Playbook. If this is your first installation, you might want to reboot in order for the settings to take effect."
