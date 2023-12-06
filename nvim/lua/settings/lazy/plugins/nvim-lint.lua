return {
  "mfussenegger/nvim-lint",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  event = { "BufReadPre", "BufWritePost" },
  init = function()
    local lint = require("lint")
    local whichKey = require("which-key")

    whichKey.register({
      ["<leader>e"] = {
        name = "Errors",
        f = {
          function()
            lint.try_lint()
          end,
          "Find linter errors"
        }
      }
    })
  end,
  config = function()
    local lint = require("lint")
    local phpcs = lint.linters.phpcs

    phpcs.args = {
      "-q",
      -- <- Add a new parameter here
      "--standard=PSR12",
      "--report=json",
      "-",
    }

    lint.linters_by_ft = {
      lua = { "luacheck" },
      javascript = { "eslint" },
      typescript = { "eslint" },
      javascriptreact = { "eslint" },
      typescriptreact = { "eslint" },
      vue = { "eslint" },
      sh = { "shellcheck" },
      fish = { "fish" },
      json = { "jsonlint" },
      markdown = { "markdownlint" },
      php = { "php", "phpcs", "phpstan" },
      css = { "stylelint" },
      yaml = { "yamllint" },
    }
  end,
}
