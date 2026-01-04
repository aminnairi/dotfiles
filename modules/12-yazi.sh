#!/bin/bash

ensure_package_is_installed yazi &&
  ensure_package_is_installed ffmpeg &&
  ensure_package_is_installed 7zip &&
  ensure_package_is_installed jq &&
  ensure_package_is_installed poppler &&
  ensure_package_is_installed fd &&
  ensure_package_is_installed ripgrep &&
  ensure_package_is_installed fzf &&
  ensure_package_is_installed zoxide &&
  ensure_package_is_installed resvg &&
  ensure_package_is_installed imagemagick &&
  ensure_package_is_installed wl-clipboard
