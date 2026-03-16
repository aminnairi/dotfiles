#!/bin/bash

source ./modules/00-library.sh &&
  ensure_package_is_installed kitty &&
  ensure_package_is_installed viu &&
  ensure_package_is_installed ueberzugpp &&
  ensure_package_is_installed otf-operator-lig-mono &&
  synchronize_user_folder ./sources/kitty ~/.config &&
  synchronize_root_folder ./sources/kitty /root/.config
