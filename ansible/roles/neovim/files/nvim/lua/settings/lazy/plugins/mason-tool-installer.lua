return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "stylua",
      "luacheck",
      "stylelint",
      "shellcheck",
      "rustfmt",
      "jq",
      "jsonlint",
      "htmlbeautifier",
      "eslint",
      "markdownlint",
      "yamllint",
      "ansible-lint",
      "eslint_d",
      "phpcbf",
      "phpcs",
    },
    auto_update = true,
    run_on_start = true,
  }
}
