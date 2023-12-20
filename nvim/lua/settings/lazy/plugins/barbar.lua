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
      ["<leader>b"] = {
        name = "Barbar",
        d = {
          "<cmd>BarbarDisable<cr>",
          "Disable Barbar"
        },
        e = {
          "<cmd>BarbarEnable<cr>",
          "Enable Barbar"
        },
        c = {
          name = "Close",
          c = {
            "<cmd>BufferCloseAllButCurrent<cr>",
            "Close all buffers but the current one"
          },
          p = {
            "<cmd>BufferCloseAllButPinned<cr>",
            "Close all buffers but the pinned ones"
          },
          l = {
            "<cmd>BufferCloseBuffersLeft<cr>",
            "Close all buffers to the left"
          },
          r = {
            "<cmd>BufferCloseBuffersRight<cr>",
            "Close all buffers to the right"
          }
        }
      }
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
