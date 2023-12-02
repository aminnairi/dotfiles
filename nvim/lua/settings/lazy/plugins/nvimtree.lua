return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    require("nvim-tree").setup({
      auto_reload_on_write = true,
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      filters = {
        dotfiles = false,
      },
    })

    local whichKey = require("which-key")

    whichKey.register({
      ["<leader>n"] = {
        name = "NvimTree",
        t = {
          function()
            require("nvim-tree.api").tree.toggle()
          end,
          "Toggle NvimTree",
        },
        f = {
          function()
            require("nvim-tree.api").tree.focus()
          end,
          "Focus NvimTree",
        },
        e = {
          function()
            require("nvim-tree.api").tree.expand_all()
          end,
          "Expand NvimTree",
        },
        c = {
          function()
            require("nvim-tree.api").tree.collapse_all()
          end,
          "Collapse NvimTree",
        },
      },
    })
  end,
}
