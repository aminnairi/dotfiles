function tmux
  if test (count $argv) -eq 0
    # Install Tmux plugins
    ~/.tmux/plugins/tpm/bin/install_plugins

    # Update Tmux plugins
    ~/.tmux/plugins/tpm/bin/update_plugins all
  end

  # Execute TMUX
  /usr/bin/tmux -u $argv
end
