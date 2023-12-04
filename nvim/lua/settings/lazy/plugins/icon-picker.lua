return {
  "ziontee113/icon-picker.nvim",
  event = "VeryLazy",
  config = function()
    local iconPicker = require("icon-picker")
    local whichKey = require("which-key")

    iconPicker.setup({
      disable_legacy_commands = true
    })

    whichKey.register({
      ["<leader>i"] = {
        name = "Icon Picker",
        e = {
          function()
            vim.cmd("IconPickerInsert emoji")
          end,
          "Pick emoji"
        },
        s = {
          function()
            vim.cmd("IconPickerInsert symbols")
          end,
          "Pick symbol"
        },
        n = {
          function()
            vim.cmd("IconPickerInsert nerd_font")
          end,
          "Pick Nerd font symbol"
        }
      }
    })
  end
}
