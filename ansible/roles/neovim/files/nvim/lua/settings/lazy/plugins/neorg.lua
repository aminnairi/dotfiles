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
              -- Configure code blocks icons behavior
              code_blocks = {
                -- Allow to conceal the "@code" and "@end" part of the code blocks
                conceal = true,
                -- Configure the padding for the code inside code blocks
                padding = {
                  -- Add 2 spaces before the beginning of the code blocks
                  left = 2
                }
              },
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
