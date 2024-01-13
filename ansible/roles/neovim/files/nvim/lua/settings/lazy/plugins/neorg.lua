return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
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
  end,
}
