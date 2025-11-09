#!/bin/bash

ensure_package_is_installed niri \
  && ensure_package_is_installed gdm \
  && ensure_package_is_installed quickshell \
  && ensure_package_is_installed ttf-roboto \
  && ensure_package_is_installed inter-font \
  && ensure_package_is_installed gpu-screen-recorder \
  && ensure_package_is_installed brightnessctl \
  && ensure_package_is_installed noctalia-shell \
  && ensure_package_is_installed xdg-desktop-portal-gtk \
  && ensure_package_is_installed xdg-desktop-portal-gnome \
  && ensure_package_is_installed gnome-keyring \
  && ensure_package_is_installed plasma-polkit-agent \
  && ensure_package_is_installed xwayland-satellite \
  && ensure_package_is_installed cliphist \
  && ensure_package_is_installed matugen-git \
  && ensure_package_is_installed cava \
  && ensure_package_is_installed wlsunset \
  && ensure_package_is_installed xdg-desktop-portal \
  && ensure_package_is_installed python3 \
  && ensure_package_is_installed evolution-data-server \
  && synchronize_user_folder ./sources/niri ~/.config \
  && synchronize_root_folder ./sources/niri ~/.config
