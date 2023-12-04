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
      ["<leader>g"] = {
        name = "Neogit",
        g = {
          function()
            neogit.open()
          end,
          "Open Neogit"
        },
        c = {
          function()
            neogit.open({ "commit" })
          end,
          "Open Neogit commit"
        }
      }
    })
  end
}
