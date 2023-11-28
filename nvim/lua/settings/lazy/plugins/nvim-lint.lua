return {
  "mfussenegger/nvim-lint",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  events = { "BufReadPre", "BufWritePost" },
  init = function()
    local lint = require("lint")

    vim.api.nvim_create_autocmd(
      { "TextChanged", "TextChangedI", "BufEnter", "BufReadPre", "BufWritePost", "CursorHold", "CursorHoldI" }, {
        callback = function()
          lint.try_lint()
        end,
      })
  end,
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      lua = { "luacheck" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      vue = { "eslint" },
      sh = { "shellcheck" },
      fish = { "fish" },
      json = { "jsonlint", },
      markdown = { "markdownlint" },
      php = { "php", "phpcs", "phpstan" },
      css = { "stylelint" },
      yaml = { "yamllint" }
    }
  end
}
