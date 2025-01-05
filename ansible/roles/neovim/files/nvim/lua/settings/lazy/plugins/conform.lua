return {
  "stevearc/conform.nvim",
  init = function()
    local whichKey = require("which-key")
    local conform = require("conform")

    whichKey.add({
      { "<leader>f", group = "Format" },
      {
        "<leader>ff",
        function() 
          local currentFileBufferNumber = vim.fn.bufnr("%")
          conform.format({ bufnr = currentFileBufferNumber })
        end,
        desc = "Current File",
      },
    })
  end,
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "eslint_d" },
        php = { "phpcbf" },
        elm = { "elm_format" },
        fish = { "fish_indent" },
      },
    })

    conform.formatters.phpcbf = {
      prepend_args = {
        "--standard=PSR12",
      },
    }
  end,
}
