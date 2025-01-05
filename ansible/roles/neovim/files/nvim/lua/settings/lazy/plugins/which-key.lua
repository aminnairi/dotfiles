return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  config = function()
    require("which-key").register({
      { "<C-h>", "<C-w>h", },
      { "<C-l>", "<C-w>l", },
      { "<C-j>", "<C-w>j", },
      { "<C-s>", ":write<CR>", },
      { "<C-q>", ":quitall<CR>", },
      { "<C-k>", "<C-w>k", },
    })
  end
}
