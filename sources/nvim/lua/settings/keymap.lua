vim.g.mapleader = " "
vim.g.maplocalleader = " "

local options = {
  noremap = true,
  silent = true
}

-- Move the current line down one line in normal mode
vim.keymap.set('n', '<A-j>', ":move .+1<CR>==", options)

-- Move the current line up one line in normal mode
vim.keymap.set('n', '<A-k>', ":move .-2<CR>==", options)

-- Move the character under the cursor one character forward in normal mode
vim.keymap.set('n', '<A-l>', "xp", options)

-- Move the character under the cursor one character backward in normal mode
vim.keymap.set('n', '<A-h>', "xhP", options)

-- Move the current range down one line in visual-line mode
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv=gv", options)

-- Move the current range up one line in visual-line mode
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv=gv", options)

-- Move the current line down one line in insert mode
vim.keymap.set('i', '<A-j>', "<ESC>:move .+1<CR>==gi", options)

-- Move the current line up one line in insert mode
vim.keymap.set('i', '<A-k>', "<ESC>:move .-2<CR>==gi", options)

-- Move the character under the cursor one character forward in insert mode
vim.keymap.set('i', '<A-l>', "<ESC>lxpi", options)

-- Move the character under the cursor one character backward in insert mode
vim.keymap.set('i', '<A-h>', "<ESC>lxhPi", options)
