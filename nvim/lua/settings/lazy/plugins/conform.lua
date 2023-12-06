return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "eslint_d" },
      php = { "phpcbf" }
    },
  },
  init = function()
    local whichKey = require("which-key");
    local conform  = require("conform")

    whichKey.register({
      ["<leader>f"] = {
        name = "Format",
        f = {
          function()
            local currentFileBufferNumber = vim.fn.bufnr("%")

            conform.format({ bufnr = currentFileBufferNumber })
          end,
          "Format the current file"
        }
      }
    })
  end,
}
