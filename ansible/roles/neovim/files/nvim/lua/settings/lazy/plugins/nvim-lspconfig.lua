return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "folke/neodev.nvim"
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local whichKey = require("which-key")
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }

    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local on_attach = function(_, buffer)
      whichKey.add({
        { "<leader>l", group = "LSP" },
        { "<leader>lb", group = "LSP Buffer" },
        { "<leader>lbD", function() vim.lsp.buf.declaration() end, buffer = 1, desc = "Go to symbol declaration" },
        { "<leader>lbR", function() vim.lsp.buf.references() end, buffer = 1, desc = "Go to symbol references" },
        { "<leader>lbc", function() vim.lsp.buf.code_action() end, buffer = 1, desc = "LSP code action" },
        { "<leader>lbd", function() vim.lsp.buf.definition() end, buffer = 1, desc = "Go to symbol definition" },
        { "<leader>lbf", function() vim.lsp.buf.format() end, buffer = 1, desc = "Format file" },
        { "<leader>lbh", function() vim.lsp.buf.hover() end, buffer = 1, desc = "Hover symbol documentation" },
        { "<leader>lbi", function() vim.lsp.buf.implementation() end, buffer = 1, desc = "Go to symbol implementation" },
        { "<leader>lbr", function() vim.lsp.buf.rename() end, buffer = 1, desc = "Rename symbol" },
        { "<leader>lbs", function() vim.lsp.buf.signature_help() end, buffer = 1, desc = "Go to symbol signature" },
        { "<leader>lbt", function() vim.lsp.buf.type_definition() end, buffer = 1, desc = "Go to symbol type definition" },
        { "<leader>ld", group = "LSP Diagnostic" },
        { "<leader>ldn", function() vim.diagnostic.goto_next() end, desc = "Next LSP diagnostic" },
        { "<leader>ldo", function() vim.diagnostic.open_float() end, desc = "Open LSP diagnostic" },
        { "<leader>ldp", function() vim.diagnostic.goto_prev() end, desc = "Previous LSP diagnostic" },
      })
    end

    -- Needed in order to get more completion in Lua files for Vim/Neovim
    require("neodev").setup()

    local languageServers = {
      "lua_ls",
      "ts_ls",
      "denols",
      "volar",
      "cssls",
      "cssmodules_ls",
      "prismals",
      "yamlls",
      "marksman",
      "eslint",
      "dockerls",
      "rust_analyzer",
      "intelephense",
      "elmls",
      "jsonls"
    }

    for _, languageServerName in pairs(languageServers) do
      lspconfig[languageServerName].setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
    end
  end,
}
