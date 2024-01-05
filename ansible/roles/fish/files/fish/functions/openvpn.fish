function openvpn
  # Store the folder's path leading to the *.ovpn files
  set openvpn_files_path "/etc/privateinternetaccess"

  # If there are no openvpn configuration files available
  if test -eq 0 (/usr/bin/ls $openvpn_files_path)
    # Bail out and exit with an error
    echo "Error: no OpenVPN files found in $openvpn_files_path"
    return 1
  end

  # Set the OpenVPN file name choosen by the user
  set selected_file (/usr/bin/ls $openvpn_files_path | fzf)

  # Set the full path to the OpenVPN configuration file
  set selected_file_path $openvpn_files_path/$selected_file
 
  # Prevent this script from running if the path is incorrect
  if not test -f $selected_file_path
    # Bail out and exit with an error
    echo "Error: Configuration file not found at $selected_file_path"
    return 2
  end

  # Open a new OpenVPN tunnel without caching the credentials by providing the path to a configuration
  sudo openvpn --auth-nocache --config $selected_file_path

  # Notification
  notify-send "OpenVPN" "Disconnected from OpenVPN"
end
