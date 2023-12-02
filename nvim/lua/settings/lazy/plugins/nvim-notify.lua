return {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  config = function()
    vim.notify = require("notify")

    require("notify.config").setup({
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
