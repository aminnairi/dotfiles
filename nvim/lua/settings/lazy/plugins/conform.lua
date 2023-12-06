return {
  "stevearc/conform.nvim",
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
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "eslint_d" },
        php = { "phpcbf" }
      },
    })

    conform.formatters.phpcbf = {
      prepend_args = {
        "--standard=PSR12"
      }
    }
  end
}
