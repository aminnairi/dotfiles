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
      whichKey.register({
        ["<leader>l"] = {
          name = "LSP",
          d = {
            name = "LSP Diagnostic",
            o = {
              function()
                vim.diagnostic.open_float()
              end,
              "Open LSP diagnostic",
            },
            p = {
              function()
                vim.diagnostic.goto_prev()
              end,
              "Previous LSP diagnostic",
            },
            n = {
              function()
                vim.diagnostic.goto_next()
              end,
              "Next LSP diagnostic",
            },
          },
          b = {
            name = "LSP Buffer",
            D = {
              function()
                vim.lsp.buf.declaration()
              end,
              "Go to symbol declaration",
              buffer = buffer,
            },
            d = {
              function()
                vim.lsp.buf.definition()
              end,
              "Go to symbol definition",
              buffer = buffer,
            },
            h = {
              function()
                vim.lsp.buf.hover()
              end,
              "Hover symbol documentation",
              buffer = buffer,
            },
            i = {
              function()
                vim.lsp.buf.implementation()
              end,
              "Go to symbol implementation",
              buffer = buffer,
            },
            s = {
              function()
                vim.lsp.buf.signature_help()
              end,
              "Go to symbol signature",
              buffer = buffer,
            },
            t = {
              function()
                vim.lsp.buf.type_definition()
              end,
              "Go to symbol type definition",
              buffer = buffer,
            },
            r = {
              function()
                vim.lsp.buf.rename()
              end,
              "Rename symbol",
              buffer = buffer,
            },
            c = {
              function()
                vim.lsp.buf.code_action()
              end,
              "LSP code action",
              buffer = buffer,
            },
            R = {
              function()
                vim.lsp.buf.references()
              end,
              "Go to symbol deferences",
              buffer = buffer,
            },
            f = {
              function()
                vim.lsp.buf.format({
                  async = true,
                })
              end,
              "Format file",
              buffer = buffer,
            },
          },
        },
      })
    end

    -- Needed in order to get more completion in Lua files for Vim/Neovim
    require("neodev").setup()

    local languageServers = {
      "lua_ls",
      "tsserver",
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
    }

    for _, languageServerName in pairs(languageServers) do
      lspconfig[languageServerName].setup({
        capabilities = capabilities,
        on_attach = on_attach
      })
    end
  end,
}
