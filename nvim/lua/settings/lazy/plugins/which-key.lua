return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  config = function()
    local whichKey = require("which-key")

    whichKey.register({
      ["<leader>n"] = {
        name = "NvimTree",
        t = {
          function()
            require("nvim-tree.api").tree.toggle()
          end,
          "Toggle",
        },
        f = {
          function()
            require("nvim-tree.api").tree.focus()
          end,
          "Focus",
        },
        e = {
          function()
            require("nvim-tree.api").tree.expand_all()
          end,
          "Expand",
        },
        c = {
          function()
            require("nvim-tree.api").tree.collapse_all()
          end,
          "Collapse",
        },
      },
      ["<leader>t"] = {
        name = "Telescope",
        t = {
          function()
            require("telescope.builtin").treesitter()
          end,
          "Explore the Abstract Syntax Tree",
        },
        f = {
          function()
            require("telescope.builtin").find_files()
          end,
          "Find files",
        },
        w = {
          function()
            require("telescope.builtin").live_grep()
          end,
          "Find words",
        },
        c = {
          function()
            require("telescope.builtin").colorscheme()
          end,
          "Find color schemes",
        },
        g = {
          function()
            require("telescope.builtin").git_files()
          end,
          "Find git files",
        },
        l = {
          name = "LSP",
          e = {
            function()
              require("telescope.builtin").diagnostics()
            end,
            "List diagnostics for all open buffers",
          },
          r = {
            function()
              require("telescope.builtin").lsp_references()
            end,
            "List all references for the word under the cursor",
          },
          i = {
            function()
              require("telescope.builtin").lsp_implementation()
            end,
            "Go to the implementation of the word under the cursor",
          },
          d = {
            function()
              require("telescope.builtin").lsp_definition()
            end,
            "Go to the definition of the word under the cursor",
          },
          t = {
            function()
              require("telescope.builtin").lsp_type_definition()
            end,
            "Go to the type definition of the word under the cursor",
          },
        },
      },
      ["<leader>v"] = {
        name = "Visit link",
        v = {
          function()
            require("link-visitor").visit()
          end,
          "Visit",
        },
        l = {
          function()
            require("link-visitor").link_under_cursor()
          end,
          "Under cursor",
        },
        n = {
          function()
            require("link-visitor").link_near_cursor()
          end,
          "Near cursor",
        },
        N = {
          function()
            require("link-visitor").link_nearest()
          end,
          "Near cursor",
        },
      },
    })
  end,
}
