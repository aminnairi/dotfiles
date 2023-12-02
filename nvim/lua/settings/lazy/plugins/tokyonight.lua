return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("tokyonight")
    end,
    opts = {
      style = "storm",
      transparent = false,
      light_style = "day",
      terminal_colors = true,
    },
  },
}
