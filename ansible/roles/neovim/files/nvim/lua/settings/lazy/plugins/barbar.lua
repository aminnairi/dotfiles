return {
  "romgrk/barbar.nvim",
  event = "BufNew",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  init = function()
    vim.g.barbar_auto_setup = false

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }
    local whichKey = require("which-key")

    whichKey.register({
      "<leader>b",
      desc = "Barbar",
      {
        "<leader>bc",
        desc = "Barbar Close",
        {
          "<leader>bcc",
          "<cmd>BufferCloseAllButCurrent<cr>",
          desc = "Barbar Close All But Current"
        },
        {
          "<leader>bcl",
          "<cmd>BufferCloseAllBuffersLeft<cr>",
          desc = "Barbar Close All Buffers Left"
        },
        {
          "<leader>bcr",
          "<cmd>BufferCloseAllBuffersRight<cr>",
          desc = "Barbar Close All Buffers Right"
        }
      },
    })

    map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
    map("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)
    map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
    map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)
    map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", opts)
    map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", opts)
    map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", opts)
    map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", opts)
    map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", opts)
    map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", opts)
    map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", opts)
    map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", opts)
    map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", opts)
    map("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)
    map("n", "<A-p>", "<Cmd>BufferPin<CR>", opts)
    map("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)
    map("n", "<A-p>", "<Cmd>BufferPick<CR>", opts)
  end,
  opts = {},
}
