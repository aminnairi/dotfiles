#!/bin/bash

ensure_package_is_installed nvim \
  && synchronize_user_folder ./sources/nvim/ ~/.config/nvim