return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  config = function()
    require("which-key").register({
      { "<C-h>", "<C-w>h", desc = "Move to the window on the left" },
      { "<C-j>", "<C-w>j", desc = "Move to the window on the bottom" },
      { "<C-k>", "<C-w>k", desc = "Move to the window on the top" },
      { "<C-l>", "<C-w>l", desc = "Move to the window on the right" },
      { "<C-q>", ":quitall<CR>", desc = "Quit the editor with confirmation" },
      { "<C-s>", ":write<CR>", desc = "Persist the content of the current buffer to the file system" },
    })
  end
}
