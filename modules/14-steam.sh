#!/bin/sh

ensure_package_is_installed steam &&
  ensure_package_is_installed bluez &&
  ensure_package_is_installed bluez-utils &&
  ensure_package_is_installed xone-dkms
