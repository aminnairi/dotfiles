return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    local notify = require("notify")

    vim.notify = notify

    require("which-key").register({
      ["<leader>u"] = {
        name = "User Interface",
        n = {
          name = "Notification",
          e = {
            function()
              vim.notify = notify
            end,
            "Enable notifications"
          },
          d = {
            function()
              vim.notify = function() end
            end,
            "Disable notifications"
          },
          l = {
            function()
              require("telescope").extensions.notify.notify()
            end,
            "List notifications"
          }
        }
      }
    })

    require("notify.config").setup({
      enabled = false,
      stages = "fade_in_slide_out",
      timeout = 5000,
      background_colour = "#1e222a",
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
      },
    })
  end,
}
