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
  end,
}
