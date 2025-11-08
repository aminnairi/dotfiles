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

    whichKey.add({
      { "<leader>t", group = "Telescope" },
      { "<leader>th", function() telescopeBuiltin.help_tags() end, desc = "Help Tags" },
      { "<leader>tt", function() telescopeBuiltin.treesitter() end, desc = "Treesitter" },
      { "<leader>tf", function() telescopeBuiltin.find_files() end, desc = "Files" },
      { "<leader>tw", function() telescopeBuiltin.live_grep() end, desc = "Words" },
      { "<leader>tc", function() telescopeBuiltin.colorscheme() end, desc = "Colorscheme" },
      { "<leader>tg", function() telescopeBuiltin.git_files() end, desc = "Colorscheme" },
    })
  end,
}
