#!/bin/bash

ensure_package_is_installed fish \
  && ensure_package_is_installed eza \
  && ensure_package_is_installed bat \
  && ensure_package_is_installed fastfetch \
  && ensure_package_is_installed openvpn \
  && ensure_package_is_installed fzf \
  && synchronize_user_folder ./sources/fish ~/.config \
  && synchronize_user_folder ./sources/omf ~/.config \
  && synchronize_root_folder ./sources/fish /root/.config \
  && synchronize_root_folder ./sources/omf /root/.config \
  && ensure_git_folder_installed_for_user oh-my-fish/oh-my-fish ~/.local/share/omf \
  && ensure_git_folder_installed_for_user oh-my-fish/theme-agnoster ~/.local/share/omf/themes/agnoster \
  && ensure_git_folder_installed_for_root oh-my-fish/oh-my-fish /root/.local/share/omf \
  && ensure_git_folder_installed_for_root oh-my-fish/theme-agnoster /root/.local/share/omf/themes/agnoster \
  && ensure_shell_installed fish