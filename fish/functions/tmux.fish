function tmux
  if test (count $argv) -eq 0
    if type -q omf
      # Update Oh My Fish if it installed
      omf update
    end
  end

  # Install Tmux plugins
  ~/.tmux/plugins/tpm/bin/install_plugins

  # Execute TMUX
  /usr/bin/tmux -u $argv
end
