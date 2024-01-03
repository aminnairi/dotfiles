local function use_nvim_tree_width(options)
  if type(options) ~= "table" then
    return
  end

  ---@type number
  local offset = options.offset

  ---@type number
  local initial_width = options.initial_width

  local initial_width_type = type(initial_width)

  local on_width_updated = options.on_width_updated

  if type(on_width_updated) ~= "function" then
    on_width_updated = function() end
  end

  if type(offset) ~= "number" then
    offset = 10
  end

  if initial_width_type ~= "number" and initial_width_type ~= "table" then
    initial_width = 30
  end

  ---@type number|table
  local previous_width = initial_width

  if initial_width_type ~= "number" then
    previous_width = 30
  end

  ---@type number|table
  local width = initial_width

  local function get_width()
    return width
  end

  local function increment_width()
    if type(width) == "table" then
      width = previous_width
    end

    local new_width = width + offset

    previous_width = new_width
    width = new_width

    on_width_updated(new_width)
  end

  local function decrement_width()
    if type(width) == "table" then
      width = previous_width
    end

    local new_width = width - offset

    previous_width = new_width
    width = new_width

    on_width_updated(new_width)
  end

  local function dynamic_width()
    width = {}
    on_width_updated(width)
  end

  return get_width, increment_width, decrement_width, dynamic_width
end

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true

    local nvimTreeApi = require("nvim-tree.api")

    local get_width, increment_width, decrement_width, dynamic_width = use_nvim_tree_width({
      offset = 5,
      initial_width = 30,
      on_width_updated = function(width)
        vim.cmd.NvimTreeResize(width)
      end
    })

    require("nvim-tree").setup({
      auto_reload_on_write = true,
      sort_by = "case_sensitive",
      filters = {
        dotfiles = false,
      },
      notify = {
        -- Notifies everything from the INFO severity to ERROR
        threshold = vim.log.levels.INFO,
        absolute_path = false,
      },
        -- dynamically get the width of the tree
        width = get_width,
    })

    local whichKey = require("which-key")

    whichKey.register({
      ["<leader>n"] = {
        name = "NvimTree",
        w = {
          name = "NvimTree Width",
          i = {
            increment_width,
            "Increment NvimTree Width"
          },
          d = {
            decrement_width,
            "Increment NvimTree Width"
          },
          a = {
            dynamic_width,
            "Automatic NvimTree Width"
          }
        },
        t = {
          function()
            nvimTreeApi.tree.toggle()
          end,
          "Toggle NvimTree",
        },
        f = {
          function()
            nvimTreeApi.tree.focus()
          end,
          "Focus NvimTree",
        },
        e = {
          function()
            nvimTreeApi.tree.expand_all()
          end,
          "Expand NvimTree",
        },
        c = {
          function()
            nvimTreeApi.tree.collapse_all()
          end,
          "Collapse NvimTree",
        },
      },
    })
  end,
}
