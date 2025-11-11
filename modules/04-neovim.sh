#!/bin/bash

ensure_package_is_installed nvim &&
  ensure_package_is_installed lazygit &&
  synchronize_user_folder ./sources/nvim/ ~/.config/nvim &&
  synchronize_root_folder ./sources/nvim /root/.config/nvim

