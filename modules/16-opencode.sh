source ./modules/00-library.sh &&
  ensure_package_is_installed opencode &&
  synchronize_user_folder sources/opencode ~/.config
