return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
  opts = {
    style = "storm",
    light_style = "day",
    transparent = false,
    terminal_colors = true,
  },
}
