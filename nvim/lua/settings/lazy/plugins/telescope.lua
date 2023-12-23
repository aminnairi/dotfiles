return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local telescopeBuiltin = require("telescope.builtin")

    telescope.setup({})

    local whichKey = require("which-key")

    whichKey.register({
      ["<leader>t"] = {
        name = "Telescope",
        h = {
          function()
            telescopeBuiltin.help_tags()
          end,
          "Find help tags"
        },
        t = {
          function()
            telescopeBuiltin.treesitter()
          end,
          "Explore the Abstract Syntax Tree",
        },
        f = {
          function()
            telescopeBuiltin.find_files()
          end,
          "Find files",
        },
        w = {
          function()
            telescopeBuiltin.live_grep()
          end,
          "Find words",
        },
        c = {
          function()
            telescopeBuiltin.colorscheme()
          end,
          "Find color schemes",
        },
        g = {
          function()
            telescopeBuiltin.git_files()
          end,
          "Find git files",
        },
      },
    })
  end,
}
