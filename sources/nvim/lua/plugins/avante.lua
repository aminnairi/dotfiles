return {
  "yetone/avante.nvim",
  opts = {
    provider = "openrouter",
    auto_suggestions_provider = "openrouter",
    providers = {
      ollama = {
        endpoint = "http://ollama.nairi.local",
        model = "qwen2.5-coder:7b",
        extra_request_body = {
          temperature = 0,
        },
      },
      openrouter = {
        __inherited_from = "openai",
        endpoint = "https://openrouter.ai/api/v1",
        model = "z-ai/glm-4.5-air:free",
        extra_request_body = {
          temperature = 0,
          max_tokens = 32768,
        },
      },
      claude = {
        endpoint = "https://api.anthropic.com",
        extra_request_body = {
          temperature = 0,
          max_tokens = 8192,
        },
      },
    },
    behaviour = {
      auto_suggestions = false, -- Experimental stage
      auto_set_highlight_group = true,
      auto_set_keymaps = true,
      auto_apply_diff_after_generation = false,
      support_paste_from_clipboard = true,
    },
    input = {
      provider = "snacks", -- Use folke/snacks.nvim already installed by LazyVim
      provider_opts = {
        title = "Avante — API Key",
        icon = " ",
        placeholder = "sk-ant-...",
      },
    },
    mappings = {
      --- @class AvanteConflictMappings
      ask = "<leader>aa",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      diff = {
        ours = "co",
        theirs = "ct",
        all_theirs = "ca",
        both = "cb",
        cursor = "cc",
        next = "]x",
        prev = "[x",
      },
      suggestion = {
        accept = "<M-l>",
        next = "<M-]>",
        prev = "<M-[>",
        dismiss = "<C-]>",
      },
      jump = {
        next = "]]",
        prev = "[[",
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
      },
    },
    hints = { enabled = true },
    windows = {
      ---@type "right" | "left" | "top" | "bottom"
      position = "right", -- the position of the sidebar
      wrap = true, -- similar to vim.o.wrap
      width = 30, -- default % based on available width
      sidebar_header = {
        align = "center", -- left, center, right for title
        rounded = true,
      },
    },
    highlights = {
      ---@type AvanteConflictHighlights
      diff = {
        current = "DiffText",
        incoming = "DiffAdd",
      },
    },
    --- @class AvanteConflictUserConfig
    diff = {
      autojump = true,
      ---@type string | fun(): any
      list_opener = "copen",
    },
  },
}
