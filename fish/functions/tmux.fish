function tmux
  if test (count $argv) -eq 0
    if type -q omf
      # Update Oh My Fish if it installed
      omf update
    end
  end

  # Execute TMUX
  /usr/bin/tmux -u $argv
end
