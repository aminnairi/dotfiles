return {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim",        -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  config = function()
    local whichKey = require("which-key")
    local neogit = require("neogit")

    neogit.setup({})

    whichKey.register({
      "<leader>g",
      desc = "Neogit",
      {
        "<leader>go",
        function()
          neogit.open()
        end,
        desc = "Neogit open"
      },
    })
  end
}
