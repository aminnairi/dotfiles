#!/bin/bash

ensure_package_is_installed git \
  && ensure_package_is_installed github-cli \
  && ensure_git_configuration_set "user.name" \
  && ensure_git_configuration_set "user.email" \
  && ensure_git_configuration_set "init.defaultbranch" \
  && ensure_root_git_configuration_set "user.name" \
  && ensure_root_git_configuration_set "user.email" \
  && ensure_root_git_configuration_set "init.defaultbranch" \
  && ensure_ssh_key_installed \
  && ensure_github_cli_authenticated
