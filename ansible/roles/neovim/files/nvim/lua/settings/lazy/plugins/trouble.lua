return {
  "folke/trouble.nvim",
  opts = {
    position = "bottom", -- position of the list can be: bottom, top, left, right
    height = 10, -- height of the trouble list when position is top or bottom
    width = 50, -- width of the list when position is left or right
    icons = true, -- use devicons for filenames
    mode = "workspace_diagnostics",
    severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
    fold_open = "", -- icon used for open folds
    fold_closed = "", -- icon used for closed folds
    group = true, -- group results by file
    padding = true, -- add an extra new line on top of the list
    cycle_results = true, -- cycle item list when reaching beginning or end of list
    action_keys = { -- key mappings for actions in the trouble list
      -- map to {} to remove a mapping, for example:
      -- close = {},
      close = "q",
      cancel = "<esc>",
      refresh = "r",
      jump = { "<cr>", "<tab>", "<2-leftmouse>" },
      open_split = { "<c-x>" },
      open_vsplit = { "<c-v>" },
      open_tab = { "<c-t>" },
      jump_close = { "o" },
      toggle_mode = "m",
      switch_severity = "s",
      toggle_preview = "P",
      hover = "K",
      preview = "p",
      open_code_href = "c",
      close_folds = { "zM", "zm" },                                                       -- close all folds
      open_folds = { "zR", "zr" },                                                        -- open all folds
      toggle_fold = { "zA", "za" },                                                       -- toggle fold of current file
      previous = "k",                                                                     -- previous item
      next = "j",                                                                         -- next item,
      help = "?"                                                                          -- help menu
    },
    multiline = true,                                                                     -- render multi-line messages
    indent_lines = true,
    win_config = { border = "single" },
    auto_open = false,
    auto_close = false,
    auto_preview = true,
    auto_fold = false,
    auto_jump = { "lsp_definitions" },
    include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" },
    signs = {
      -- icons / text used for a diagnostic
      error = "",
      warning = "",
      hint = "",
      information = "",
      other = "",
    },
    use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
  },
  config = function()
    local whichKey = require("which-key")
    local trouble = require("trouble")

    whichKey.register({
      ["<leader>x"] = {
        name = "Trouble",
        t = {
          function()
            trouble.toggle()
          end,
          "Toggle Trouble"
        },
        o = {
          function()
            trouble.open()
          end,
          "Open Trouble"
        },
        c = {
          function()
            trouble.close()
          end,
          "Close Trouble"
        },
        n = {
          function()
            trouble.next({
              skip_groups = true,
              jump = true
            })
          end,
          "Trouble next item"
        },
        p = {
          function()
            trouble.previous({
              skip_groups = true,
              jump = true
            })
          end,
          "Trouble previous item"
        },
        f = {
          function()
            trouble.first({
              skip_groups = true,
              jump = true
            })
          end,
          "Trouble first item"
        },
        l = {
          function()
            trouble.last({
              skip_groups = true,
              jump = true
            })
          end,
          "Trouble last item"
        }
      }
    })
  end
}
