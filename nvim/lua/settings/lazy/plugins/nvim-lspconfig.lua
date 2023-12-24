return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
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

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if not vim.loop.fs_stat(path .. '/.luarc.json') and not vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using
                -- (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT'
              },
              diagnostics = {
                globals = {
                  "vim"
                },
              },
              -- Make the server aware of Neovim runtime files
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.env.VIMRUNTIME
                  -- "${3rd}/luv/library"
                  -- "${3rd}/busted/library",
                }
                -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                -- library = vim.api.nvim_get_runtime_file("", true)
              }
            }
          })

          client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
        end
        return true
      end
    })

    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.volar.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "vue",
      },
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "css",
        "scss",
        "sass",
        "less",
      },
    })

    lspconfig.cssmodules_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
    })

    lspconfig.prismals.setup({
      on_attach = on_attach,
      filetypes = {
        "prisma",
      },
      capabilities = capabilities,
    })

    lspconfig.yamlls.setup({
      capabilities = capabilities,
      filetypes = {
        "yaml",
      },
    })

    lspconfig.marksman.setup({
      capabilities = capabilities,
      filetypes = {
        "markdown",
      },
    })

    lspconfig.eslint.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.dockerls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.intelephense.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.elmls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
