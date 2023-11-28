return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    ensure_installed = {
      "tsserver",
      "lua_ls",
      "volar",
      "cssls",
      "cssmodules_ls",
      "prismals",
      "yamlls",
      "marksman",
      "eslint",
      "dockerls"
    },
  },
}
