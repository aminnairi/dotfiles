return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "folke/which-key.nvim",
  },
  -- init = function()
  --   -- Configure the key to use for keybinds used in the "core.keybinds" module
  --   vim.g.maplocalleader = ","
  -- end,
  config = function()
    require("neorg").setup({
      load = {
        -- Default module that imports the core modules necessary for Neorg
        ["core.defaults"] = {},
        -- Module responsible for enhancing the icons display in Neorg files
        ["core.concealer"] = {
          -- Configuration for the "core.concealer" module
          config = {
            -- Configure icons for concealed items
            icons = {
              -- Configure the code blocks
              code_block = {
                -- Conceal the "@code" and "@end" completely when in normal modej
                conceal = true,
                -- Add padding to a code inside a code block
                padding = {
                  -- Add 2 spaces before the code inside a code block
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
                  "○",
                },
              },
            },
          },
        },
        ["core.dirman"] = {
          -- Configuration for "core.dirman" module
          config = {
            -- Workspaces are folders from where to find Neorg files
            workspaces = {
              -- My personal notes
              notes = "~/git/github.com/aminnairi/notes",
            },
          },
        },
        -- Module for controling the presentation mode for Neorg files
        ["core.presenter"] = {
          -- Configuration for the presenter module
          config = {
            -- Plugin to use, here "folke/zen-mode"
            zen_mode = "zen-mode",
          },
        },
        -- Module for controling the ability to export Neorg files
        ["core.export"] = {}
      },
    })

    require("which-key").register({
      ["<leader>o"] = {
        name = "Neorg",
        i = {
          ":Neorg index<CR>",
          "Index"
        },
        r = {
          ":Neorg return<CR>",
          "Return"
        },
        l = {
          name = "List",
          t = {
            ":Neorg keybind norg core.pivot.toggle-list-type",
            "Toggle"
          },
          i = {
            ":Neorg keybind norg core.pivot.invert-list-type",
            "Invert"
          }
        },
        w = {
          name = "Workspace",
          n = {
            ":Neorg workspace notes",
            "Notes"
          },
          d = {
            ":Neorg workspace default",
            "Default"
          }
        },
        p = {
          name = "Presenter",
          s = {
            ":Neorg presenter start<CR>",
            "Start",
          },
          S = {
            ":Neorg presenter stop<CR>",
            "Stop",
          },
        },
      },
    })
  end,
}
