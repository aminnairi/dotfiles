#!/bin/bash

ensure_package_is_installed kitty &&
  ensure_package_is_installed viu &&
  ensure_package_is_installed ueberzugpp &&
  synchronize_user_folder ./sources/kitty ~/.config &&
  synchronize_root_folder ./sources/kitty /root/.config

