function pass
  passbolt get resource --id (passbolt list resource | fzf | cut -d " " -f 1) | grep Password | cut -d " " -f 2 | xclip -selection clipboard
end
