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
    local linkVisitor = require("link-visitor");

    whichKey.add({
      { "<leader>v", group = "Link", },
      { "<leader>vv", function() linkVisitor.visit() end, },
      { "<leader>vl", function() linkVisitor.link_under_cursor() end, },
      { "<leader>vn", function() linkVisitor.link_near_cursor() end, },
      { "<leader>vN", function() linkVisitor.link_nearest() end, },
    })
  end
}
