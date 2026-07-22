return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      -- LSP Servers
      "typescript-language-server", -- TypeScript/JavaScript LSP
      "eslint-lsp", -- ESLint LSP for linting
      "tailwindcss-language-server", -- Tailwind CSS LSP
      "css-lsp", -- CSS LSP
      "html-lsp", -- HTML LSP
      "emmet-ls", -- Emmet for HTML/CSS abbreviations
      "json-lsp", -- JSON LSP
      "lua-language-server", -- Lua LSP for Neovim config

      -- Linters
      "eslint_d", -- Fast ESLint daemon
      "stylelint", -- CSS/SCSS/Less linter

      -- Additional Tools
      "shellcheck", -- Shell script linter
      "shfmt", -- Shell script formatter
      "hadolint", -- Dockerfile linter
      "yamllint", -- YAML linter
    },
  },
}
