function rm
  # Use GIO in order to move the file to trash instead of deleting it permanently
  /usr/bin/gio trash $argv
end
