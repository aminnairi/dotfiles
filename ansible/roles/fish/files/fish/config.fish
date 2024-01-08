if status is-interactive
  # Enable vi-mode
  fish_vi_key_bindings

  # Set the editor to use vim
  set --export --global EDITOR nvim

  # Add ruby in the global path for Neovim
  fish_add_path ~/.local/share/gem/ruby/3.0.0/bin

  # Add Node.js binaries in the global path
  fish_add_path ~/.local/lib/node_modules/.bin

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

  # Abbreviations for Docker Compose
  abbr --add dcb "docker compose build"
  abbr --add dccf "docker compose config"
  abbr --add dccp "docker compose cp"
  abbr --add dccr "docker compose cp"
  abbr --add dcd "docker compose down --remove-orphans --volumes --timeout 0"
  abbr --add dce "docker compose events"
  abbr --add dci "docker compose images"
  abbr --add dck "docker compose kill"
  abbr --add dclg "docker compose logs"
  abbr --add dcls "docker compose ls"
  abbr --add dcpa "docker compose pause"
  abbr --add dcpr "docker compose port"
  abbr --add dcpl "docker compose pull"
  abbr --add dcpsh "docker compose pull"
  abbr --add dcrs "docker compose restart"
  abbr --add dcrn "docker compose run"
  abbr --add dcsc "docker compose scale"
  abbr --add dcstrt "docker compose start"
  abbr --add dcstp "docker compose start"
  abbr --add dct "docker compose top"
  abbr --add dcunp "docker compose unpause"
  abbr --add dcup "docker compose up"
  abbr --add dcv "docker compose version"
  abbr --add dcwt "docker compose wait"
  abbr --add dcwa "docker compose watch"

  # Run fastfetch on each fish startup
  fastfetch
end
