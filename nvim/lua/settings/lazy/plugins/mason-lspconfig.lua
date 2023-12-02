return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  opts = {
    automatic_instalation = true,
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
