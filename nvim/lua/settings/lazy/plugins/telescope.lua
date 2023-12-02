return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").setup({})

    local whichKey = require("which-key")

    whichKey.register({
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
    })
  end,
}
