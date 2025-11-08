return {
  "ziontee113/icon-picker.nvim",
  event = "VeryLazy",
  config = function()
    local iconPicker = require("icon-picker")
    local whichKey = require("which-key")

    iconPicker.setup({
      disable_legacy_commands = true
    })

    whichKey.add({
      { "<leader>i", group = "Icon" },
      { "<leader>ie", function() vim.cmd("IconPickerInsert emoji") end, group = "Emoji" },
      { "<leader>is", function() vim.cmd("IconPickerInsert symbols") end, group = "Symbol" },
      { "<leader>in", function() vim.cmd("IconPickerInsert nerd_font") end, group = "Nerd Font Symbol" },
    })
  end
}
