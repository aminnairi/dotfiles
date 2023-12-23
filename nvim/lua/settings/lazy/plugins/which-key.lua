return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 0
  end,
  config = function()
    require("which-key").register({
      ["<C-s>"] = {
        ":write",
        "Persist the content of the current buffer to the file system"
      },
      ["<C-q>"] = {
        ":quitall",
        "Quit the editor with confirmation"
      },
      ["<C-h>"] = {
        "<C-w>h",
        "Move to the window on the left"
      },
      ["<C-l>"] = {
        "<C-w>l",
        "Move to the window on the right"
      },
      ["<C-k>"] = {
        "<C-w>k",
        "Move to the window on the top"
      },
      ["<C-j>"] = {
        "<C-w>j",
        "Move to the window on the bottom"
      }
    })
  end
}
