#!/bin/bash

ensure_system_is_updated &&
  ensure_package_is_installed sudo &&
  ensure_git_configuration_set "user.name" &&
  ensure_git_configuration_set "user.email" &&
  ensure_git_configuration_set "init.defaultbranch" &&
  ensure_ssh_key_installed &&
  ensure_package_is_installed linux &&
  ensure_package_is_installed linux-headers &&
  ensure_package_is_installed linux-firmware &&
  ensure_package_is_installed grub &&
  ensure_package_is_installed efibootmgr &&
  ensure_package_is_installed mesa &&
  ensure_package_is_installed syncthing &&
  ensure_package_is_installed man &&
  ensure_package_is_installed bpytop &&
  ensure_package_is_installed bind &&
  ensure_package_is_installed which &&
  ensure_package_is_installed fd &&
  ensure_package_is_installed python &&
  ensure_package_is_installed ruby &&
  ensure_package_is_installed php &&
  ensure_package_is_installed composer &&
  ensure_package_is_installed luarocks &&
  ensure_package_is_installed wget &&
  ensure_package_is_installed unzip &&
  ensure_package_is_installed zip &&
  ensure_package_is_installed rsync &&
  ensure_package_is_installed tokei &&
  ensure_package_is_installed texlive-bin &&
  ensure_package_is_installed neovim &&
  ensure_package_is_installed chromium &&
  ensure_package_is_installed firefox &&
  ensure_package_is_installed cheat &&
  ensure_package_is_installed posting &&
  ensure_package_is_installed thefuck &&
  ensure_package_is_installed dust &&
  ensure_package_is_installed duf &&
  ensure_package_is_installed wttr &&
  ensure_package_is_installed ticker &&
  ensure_package_is_installed slides &&
  ensure_graphics_packages_installed &&
  ensure_mkinitcpio_configured_for linux
