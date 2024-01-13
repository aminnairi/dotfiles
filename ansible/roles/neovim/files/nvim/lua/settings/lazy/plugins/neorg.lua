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
            folds = true,
            icons = {
              code_blocks = {
                conceal = true,
                padding = {
                  left = 2
                }
              }
            }
          },
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
  end,
}
