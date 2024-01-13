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
            neorg_leader = "<leader>o"
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
