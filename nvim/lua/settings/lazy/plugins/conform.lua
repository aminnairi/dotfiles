return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "eslint_d" },
      php = { "phpcbf" }
    },
  },
}
