function tmux
  if type -q omf
    # Update Oh My Fish if it installed
    omf update
  end

  if test ! -d ~/.tmux/plugins/tpm
    # Install TPM if it is not already installed
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

    # Install TPM plugins
    ~/.tmux/plugins/tpm/bin/install_plugins
  else
    # Install plugins that are not already installed
    ~/.tmux/plugins/tpm/bin/install_plugins

    # Update plugins that needs update
    ~/.tmux/plugins/tpm/bin/update_plugins all

    # Clean plugins that are not used anymore
    ~/.tmux/plugins/tpm/bin/update_plugins all
  end

  # Execute TMUX
  /usr/bin/tmux
end
