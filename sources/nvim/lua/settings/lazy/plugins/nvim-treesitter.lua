return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = "VeryLazy",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all" (the five listed parsers should always be installed)
      ensure_installed = {
        "bash",
        "c",
        "css",
        "csv",
        "dockerfile",
        "elm",
        "fish",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "norg",
        "markdown",
        "markdown_inline",
        "php",
        "prisma",
        "query",
        "regex",
        "rust",
        "scss",
        "sql",
        "ssh_config",
        "svelte",
        "toml",
        "tsx",
        "twig",
        "typescript",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
      auto_install = true,

      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

      indent = {
        enable = true,
      },

      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      -- Configure text objects
      textobjects = {
        -- Text objects for selections like inside word (iw) or inside html tag (it)
        select = {
          -- Enable text objects selection
          enable = true,

          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          -- Keymaps to use for using the following selection text objects
          keymaps = {
            -- The whole function
            ["af"] = { query = "@function.outer", desc = "Select the whole function" },
            -- Inside a function
            ["if"] = { query = "@function.inner", desc = "Select inside a function" },
            -- Inside an assignment
            ["i="] = { query = "@assignment.inner", desc = "Select inside of a statement" },
            -- Left-hand-side of a statement
            ["l="] = { query = "@assignment.lhs", desc = "Select left-hand-side of a statement" },
            -- Right-hand-side of a statement
            ["r="] = { query = "@assignment.rhs", desc = "Select right-hand-side of a statement" },
            -- The whole statement
            ["a="] = { query = "@assignment.outer", desc = "Select the whole statement" },
            -- Inside of an attribute
            ["ia"] = { query = "@attribute.inner", desc = "Select inside of an attribute" },
            -- The whole attribute
            ["aa"] = { query = "@attribute.outer", desc = "Select the whole attribute" },
            -- Inside of a block
            ["ib"] = { query = "@block.inner", desc = "Select inside a block" },
            -- The whole block
            ["ab"] = { query = "@block.outer", desc = "Select the whole block" },
            -- Inside of a class
            ["ic"] = { query = "@class.inner", desc = "Select inside of a class" },
            -- The whole class
            ["ac"] = { query = "@class.outer", desc = "Select the whole class" },
            -- Inside a comment
            ["iC"] = { query = "@comment.inner", desc = "Select inside of a comment" },
            -- The whole comment
            ["aC"] = { query = "@comment.outer", desc = "Select the whole comment" },
            -- Inside of a conditional statement
            ["ii"] = { query = "@conditional.inner", desc = "Select inside of a conditional statement" },
            -- The whole conditional statement
            ["ai"] = { query = "@conditional.outer", desc = "Select the whole conditional statement" },
            -- Inside a loop
            ["il"] = { query = "@loop.inner", desc = "Select inside a loop" },
            -- The whole a loop
            ["al"] = { query = "@loop.outer", desc = "Select the whole loop" },
            -- Inside a number
            ["in"] = { query = "@number.inner", desc = "Select inside a number" },
            -- Inside a number
            ["an"] = { query = "@number.inner", desc = "Select the whole number" },
            -- Inside a parameter
            ["ip"] = { query = "@parameter.inner", desc = "Select inside a parameter" },
            -- The whole parameter
            ["ap"] = { query = "@parameter.outer", desc = "Select the whole parameter" },
            -- Inside of a regex
            ["ir"] = { query = "@regex.inner", desc = "Select inside of a regex" },
            -- The whole regex
            ["ar"] = { query = "@regex.outer", desc = "Select the whole regex" },
            -- Inside of a return statement
            ["iR"] = { query = "@return.inner", desc = "Select inside of a return statement" },
            -- The whole return statement
            ["aR"] = { query = "@return.outer", desc = "Select the whole return statement" },
          },
          -- Select surrounding white spaces as well as the selected text object
          include_surrounding_whitespace = true,
        },
      },
    })
  end,
}
