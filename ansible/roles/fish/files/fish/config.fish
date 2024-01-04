if status is-interactive
  # Enable vi-mode
  fish_vi_key_bindings

  # Set the editor to use vim
  set --export --global EDITOR nvim

  # Install OMF if it is not already
  if test ! -d ~/.local/share/omf
    curl -L https://get.oh-my.fish | fish
  end

  # Alias for the cat command
  alias cat="bat --theme ColdDark-Cold"

  # Alias for the ls command
  alias ls="eza --icons --long --classify --git --total-size --header --created --accessed --modified"

  # Add ruby in the global path for Neovim
  fish_add_path ~/.local/share/gem/ruby/3.0.0/bin

  # configuration for Oh My Fish BobTheFish theme
  set -g theme_display_git yes
  set -g theme_display_git_dirty yes
  set -g theme_display_git_untracked yes
  set -g theme_display_git_ahead_verbose yes
  set -g theme_display_git_dirty_verbose yes
  set -g theme_display_git_stashed_verbose yes
  set -g theme_display_git_default_branch yes
  set -g theme_git_default_branches development master main
  set -g theme_git_worktree_support yes
  set -g theme_use_abbreviated_branch_name yes
  set -g theme_display_vagrant no
  set -g theme_display_docker_machine yes
  set -g theme_display_k8s_context yes
  set -g theme_display_hg yes
  set -g theme_display_virtualenv no
  set -g theme_display_nix no
  set -g theme_display_ruby no
  set -g theme_display_node yes
  set -g theme_display_user ssh
  set -g theme_display_hostname ssh
  set -g theme_display_vi yes
  set -g theme_display_date yes
  set -g theme_display_cmd_duration yes
  set -g theme_title_display_process yes
  set -g theme_title_display_path no
  set -g theme_title_display_user yes
  set -g theme_title_use_abbreviated_path no
  set -g theme_date_format "+%a %H:%M"
  set -g theme_date_timezone Europe/Paris
  set -g theme_avoid_ambiguous_glyphs yes
  set -g theme_powerline_fonts yes
  set -g theme_nerd_fonts yes
  set -g theme_show_exit_status yes
  set -g theme_display_jobs_verbose yes
  set -g default_user aminnairi
  set -g theme_color_scheme dark
  set -g fish_prompt_pwd_dir_length 0
  set -g theme_project_dir_length 1
  set -g theme_newline_cursor yes
  set -g theme_newline_prompt '$ '

  # Run neofetch on each fish startup
  neofetch
end
