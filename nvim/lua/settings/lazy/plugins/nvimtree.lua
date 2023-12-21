return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    local nvimTreeApi = require("nvim-tree.api")

    require("nvim-tree").setup({
      auto_reload_on_write = true,
      sort_by = "case_sensitive",
      view = {
        width = {},
      },
      filters = {
        dotfiles = false,
      },
      notify = {
        threshold = vim.log.levels.INFO,
        absolute_path = true,
      },
    })

    local whichKey = require("which-key")

    whichKey.register({
      ["<leader>n"] = {
        name = "NvimTree",
        t = {
          function()
            nvimTreeApi.tree.toggle()
          end,
          "Toggle NvimTree",
        },
        f = {
          function()
            nvimTreeApi.tree.focus()
          end,
          "Focus NvimTree",
        },
        e = {
          function()
            nvimTreeApi.tree.expand_all()
          end,
          "Expand NvimTree",
        },
        c = {
          function()
            nvimTreeApi.tree.collapse_all()
          end,
          "Collapse NvimTree",
        },
      },
    })
  end,
}
