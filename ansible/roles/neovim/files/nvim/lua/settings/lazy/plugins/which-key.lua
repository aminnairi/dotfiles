return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  config = function()
    require("which-key").register({
      { "", "<C-l>", desc = "<C-w>l" },
      { "", "<C-h>", desc = "<C-w>h" },
      { "", "<C-j>", desc = "<C-w>j" },
      { "", "<C-s>", desc = ":write<CR>" },
      { "", "<C-q>", desc = ":quitall<CR>" },
      { "", "<C-k>", desc = "<C-w>k" },
    })
  end
}
