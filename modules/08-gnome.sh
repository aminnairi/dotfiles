#!/bin/bash

ensure_package_group_is_installed gnome &&
  ensure_package_group_is_installed gnome-extra &&
  ensure_package_is_installed python-psutil &&
  ensure_service_active gdm &&
  ensure_gnome_setting_set "org.gnome.desktop.input-sources" "xkb-options" "['compose:ralt']"

