return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
       -- LSP Servers
       "angular-language-server", -- Angular Language Server
       "typescript-language-server", -- TypeScript/JavaScript LSP
      "eslint-lsp", -- ESLint LSP for linting
      "tailwindcss-language-server", -- Tailwind CSS LSP
      "css-lsp", -- CSS LSP
      "html-lsp", -- HTML LSP
      "emmet-ls", -- Emmet for HTML/CSS abbreviations
      "json-lsp", -- JSON LSP
      "graphql-language-service-cli", -- GraphQL LSP
      "prisma-language-server", -- Prisma ORM LSP (often used with tRPC)
      "lua-language-server", -- Lua LSP for Neovim config

      -- Formatters
      "prettier", -- JavaScript/TypeScript/CSS/HTML/JSON/Markdown formatter
      "prettierd", -- Faster Prettier daemon
      "stylua", -- Lua formatter
      "rustywind", -- Tailwind CSS class sorter

      -- Linters
      "eslint_d", -- Fast ESLint daemon
      "stylelint", -- CSS/SCSS/Less linter
      "markdownlint", -- Markdown linter

      -- DAP (Debuggers)
      "js-debug-adapter", -- JavaScript/TypeScript debugger
      "node-debug2-adapter", -- Node.js debugger (alternative)

      -- Additional Tools
      "shellcheck", -- Shell script linter
      "shfmt", -- Shell script formatter
      "hadolint", -- Dockerfile linter
      "yamllint", -- YAML linter
      "yamlfmt", -- YAML formatter
    },
  },
}
