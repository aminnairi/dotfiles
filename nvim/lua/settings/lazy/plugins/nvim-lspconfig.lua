return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  init = function()
    local whichKey = require("which-key")

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        whichKey.register({
          ["<leader>l"] = {
            name = "LSP",
            d = {
              name = "Diagnostic",
              o = {
                function()
                  vim.diagnostic.open_float()
                end,
                "Open",
              },
              p = {
                function()
                  vim.diagnostic.goto_prev()
                end,
                "Previous",
              },
              n = {
                function()
                  vim.diagnostic.goto_next()
                end,
                "Next",
              },
            },
            b = {
              name = "File",
              d = {
                function()
                  vim.lsp.buf.declaration()
                end,
                "Declaration",
                buffer = ev.buf,
              },
              D = {
                function()
                  vim.lsp.buf.definition()
                end,
                "Definition",
                buffer = ev.buf,
              },
              h = {
                function()
                  vim.lsp.buf.hover()
                end,
                "Hover",
                buffer = ev.buf,
              },
              i = {
                function()
                  vim.lsp.buf.implementation()
                end,
                "Implementation",
                buffer = ev.buf,
              },
              s = {
                function()
                  vim.lsp.buf.signature_help()
                end,
                "Signature",
                buffer = ev.buf,
              },
              t = {
                function()
                  vim.lsp.buf.type_definition()
                end,
                "Type definition",
                buffer = ev.buf,
              },
              r = {
                function()
                  vim.lsp.buf.rename()
                end,
                "Rename",
                buffer = ev.buf,
              },
              c = {
                function()
                  vim.lsp.buf.code_action()
                end,
                "Code action",
                buffer = ev.buf,
              },
              R = {
                function()
                  vim.lsp.buf.references()
                end,
                "References",
                buffer = ev.buf,
              },
              f = {
                function()
                  vim.lsp.buf.format({
                    async = true,
                  })
                end,
                "Format",
                buffer = ev.buf,
              },
            },
          },
        })
      end,
    })
  end,
  config = function()
    local lspconfig = require("lspconfig")

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you"re using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
            enable = false,
          },
        },
      },
    })

    lspconfig.tsserver.setup({
      capabilities = capabilities,
    })

    lspconfig.volar.setup({
      capabilities = capabilities,
      filetypes = {
        "vue"
      },
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
      filetypes = {
        "css",
        "scss",
        "sass",
        "less",
      },
    })

    lspconfig.cssmodules_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    })

    lspconfig.prismals.setup({
      filetypes = {
        "prisma"
      },
      capabilities = capabilities
    })

    lspconfig.yamlls.setup({
      capabilities = capabilities,
      filetypes = {
        "yaml"
      },
    })

    lspconfig.marksman.setup({
      capabilities = capabilities,
      filetypes = {
        "markdown"
      }
    })

    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = function(_, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
      end,
    })

    lspconfig.dockerls.setup({
      capabilities = capabilities
    })
  end,
}
