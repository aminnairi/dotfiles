#!/bin/bash

source ./modules/00-library.sh &&
  ensure_package_is_installed docker &&
  ensure_package_is_installed docker-compose &&
  ensure_package_is_installed lazydocker &&
  ensure_group_is_installed docker &&
  ensure_service_active docker
