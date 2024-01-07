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
ERRROR_BECAUSE_FUZZY_FILE_FINDER_INSTALLATION_FAILED=5
ERROR_BECAUSE_GIT_PULL_FAILED=6
ERROR_BECAUSE_PLAYBOOK_PATH_DOES_NOT_EXIST=7

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

if [[ ! -x "$(command -v fzf)" ]]
then
  echo "Fuzzy file finder not found, installing..."

  if [[ ! "$(sudo pacman -Syy --noconfirm fzf)" ]]
  then
    echo "Installation of fuzzy file finder failed."
    display_help
    exit $ERRROR_BECAUSE_FUZZY_FILE_FINDER_INSTALLATION_FAILED
  fi
fi

if [[ $# -gt 1 ]]
then
  echo "Too much arguments provided."
  display_help
  exit $ERROR_BECAUSE_TOO_MUCH_ARGUMENTS_PROVDED
fi

choosen_playbook_path=$1

echo "Updating this repository before anything else..."

if [[ ! $(git pull --all --rebase --prune) ]]
then
  echo "Failed to update this repository"
  exit $ERROR_BECAUSE_GIT_PULL_FAILED
fi

echo "Done updating this repository, now at the latest revision."

if [[ -z $choosen_playbook_path ]]
then
  choosen_playbook_file="$(/usr/bin/find ansible -name '*.yml' -type f -maxdepth 1 | xargs basename -a | /usr/bin/fzf --header 'Choose a configuration file' --pointer 👉 --prompt 🔍)"
  choosen_playbook_path="ansible/$choosen_playbook_file"
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
