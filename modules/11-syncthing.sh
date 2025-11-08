#!/bin/bash

ensure_package_is_installed syncthing \
  && ensure_user_folder_present ~/.config/systemd/user \
  && synchronize_user_folder ./sources/syncthing/syncthing.service ~/.config/systemd/user \
  && ensure_user_service_active syncthing
