-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- Line numbers
opt.relativenumber = true -- Relative line numbers for easier navigation
opt.number = true -- Show absolute line number on cursor line

-- Search
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- Override ignorecase if search contains uppercase
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Show search matches as you type

-- Persistent undo
opt.undofile = true -- Enable persistent undo
opt.undolevels = 10000 -- Maximum number of changes that can be undone
opt.undoreload = 10000 -- Maximum number lines to save for undo on buffer reload

-- Splits
opt.splitright = true -- Vertical splits open to the right
opt.splitbelow = true -- Horizontal splits open below

-- Scroll
opt.scrolloff = 8 -- Minimum number of lines to keep above/below cursor
opt.sidescrolloff = 8 -- Minimum number of columns to keep left/right of cursor

-- Tabs & Indentation
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.shiftround = true -- Round indent to multiple of shiftwidth

-- Line wrapping
opt.wrap = false -- Disable line wrapping
opt.linebreak = true -- Wrap on word boundary

-- Clipboard
opt.clipboard = "unnamedplus" -- Sync with system clipboard

-- Mouse
opt.mouse = "a" -- Enable mouse support

-- Appearance
opt.termguicolors = true -- True color support
opt.signcolumn = "yes" -- Always show sign column
opt.cursorline = true -- Highlight current line
opt.showmode = false -- Don't show mode (already in statusline)

-- Performance
opt.updatetime = 200 -- Faster completion and swap file writing
opt.timeoutlen = 300 -- Time to wait for mapped sequence

-- Backup & Swap
opt.backup = false -- Don't create backup files
opt.writebackup = false -- Don't create backup before overwriting
opt.swapfile = false -- Don't use swap files

-- Completion
opt.completeopt = "menu,menuone,noselect" -- Completion options
opt.pumheight = 10 -- Maximum number of items in popup menu

-- Files
opt.fileencoding = "utf-8" -- File encoding
opt.conceallevel = 2 -- Hide concealed text unless cursor is on the line

-- Folding
opt.foldmethod = "expr" -- Use expression for folding
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use treesitter for folding
opt.foldenable = false -- Don't fold by default
opt.foldlevel = 99 -- High fold level to keep most folds open

-- Spell checking
opt.spelllang = { "en", "fr" } -- Spell check languages
opt.spellfile = vim.fn.stdpath("config") .. "/spell/custom.utf-8.add" -- Custom dictionary
