#!/bin/bash

source ./modules/00-library.sh &&
  ensure_package_is_installed fish &&
  ensure_package_is_installed eza &&
  ensure_package_is_installed bat &&
  ensure_package_is_installed fastfetch &&
  ensure_package_is_installed openvpn &&
  ensure_package_is_installed fzf &&
  rm -rf ~/.config/fish/themes &&
  ensure_user_folder_present ~/.config/fish &&
  synchronize_user_folder ./sources/fish/ ~/.config/fish &&
  ensure_user_folder_present ~/.config/omf &&
  synchronize_user_folder ./sources/omf/ ~/.config/omf &&
  sudo rm -rf /root/.config/fish/themes &&
  synchronize_root_folder ./sources/fish/ /root/.config/fish &&
  synchronize_root_folder ./sources/omf/ /root/.config/omf &&
  ensure_git_folder_installed_for_user oh-my-fish/oh-my-fish ~/.local/share/omf &&
  ensure_git_folder_installed_for_user oh-my-fish/theme-agnoster ~/.local/share/omf/themes/agnoster &&
  ensure_git_folder_installed_for_root oh-my-fish/oh-my-fish /root/.local/share/omf &&
  ensure_git_folder_installed_for_root oh-my-fish/theme-agnoster /root/.local/share/omf/themes/agnoster &&
  ensure_shell_installed fish
