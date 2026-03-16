#!/bin/bash

source ./modules/00-library.sh &&
  ensure_package_is_installed tmux &&
  ensure_git_folder_installed_for_user tmux-plugins/tpm ~/.tmux/plugins/tpm &&
  ensure_git_folder_installed_for_root tmux-plugins/tpm /root/.tmux/plugins/tpm &&
  synchronize_user_folder ./sources/tmux/.tmux.conf ~/ &&
  synchronize_root_folder ./sources/tmux/.tmux.conf /root
