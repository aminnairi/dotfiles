local opt = vim.opt

function MyFoldText()
  return "▼"
end

opt.autoindent = true
opt.autoread = true
opt.backspace = "indent,eol,start"
opt.bufhidden = "hide"
opt.clipboard:append("unnamedplus")
opt.confirm = true
opt.copyindent = true
opt.emoji = true
opt.encoding = "UTF-8"
opt.expandtab = true
opt.fileignorecase = true
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.infercase = true
opt.joinspaces = true
opt.laststatus = 2
opt.lazyredraw = false
opt.backup = false
opt.breakindent = false
opt.compatible = false
opt.errorbells = false
opt.linebreak = false
opt.swapfile = false
opt.number = true
opt.relativenumber = true
opt.shiftround = true
opt.shiftwidth = 2
opt.shiftwidth = 2
opt.smartcase = true
opt.smartindent = true
opt.smarttab = true
opt.softtabstop = 2
opt.tabstop = 2
opt.syntax = "on"
opt.wrap = false
opt.cursorline = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.splitright = true
opt.splitbelow = true
opt.conceallevel = 3
opt.foldmethod = "manual"
opt.foldcolumn = "1"
opt.foldtext = "MyFoldText()"
