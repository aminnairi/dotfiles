return {
  "xiyaowong/link-visitor.nvim",
  event = "BufEnter",
  opts = {
    open_cmd = nil,
    silent = true,
    skip_confirmation = true,
    border = "rounded",
  },
  config = function()
    local whichKey = require("which-key")

    whichKey.register({
      ["<leader>v"] = {
        name = "Visit link",
        v = {
          function()
            require("link-visitor").visit()
          end,
          "Visit",
        },
        l = {
          function()
            require("link-visitor").link_under_cursor()
          end,
          "Under cursor",
        },
        n = {
          function()
            require("link-visitor").link_near_cursor()
          end,
          "Near cursor",
        },
        N = {
          function()
            require("link-visitor").link_nearest()
          end,
          "Near cursor",
        },
      },
    })
  end
}
