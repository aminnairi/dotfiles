#!/bin/bash

ensure_package_is_installed ttf-jetbrains-mono-nerd \
  && ensure_package_is_installed noto-fonts \
  && ensure_package_is_installed noto-fonts-emoji \
  && ensure_package_is_installed noto-fonts-cjk \
  && ensure_package_is_installed noto-fonts-ar \
  && synchronize_user_folder ./sources/fontconfig ~/.config \
  && synchronize_root_folder ./sources/fontconfig /root/.config