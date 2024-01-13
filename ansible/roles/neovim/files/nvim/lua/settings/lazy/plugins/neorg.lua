return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {
          config = {
            -- Configure icons for concealed items
            icons = {
              -- Configure the headings
              heading = {
                -- List of icons to use for all headings levels from 1 to 6
                icons = {
                  "◉",
                  "◎",
                  "○",
                  "◉",
                  "◎",
                  "○"
                }
              }
            }
          }
        },
        ["core.keybinds"] = {
          config = {
            default_keybinds = false
          }
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/git/github.com/aminnairi/notes",
            },
          },
        },
      },
    }
    -- TODO: add keybinds for neorg
  end,
}
