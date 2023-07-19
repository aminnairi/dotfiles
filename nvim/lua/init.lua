vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.number = true
vim.o.relativenumber = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
		opts = {
			style = "storm",
			light_style = "day",
			transparent = false,
			terminal_colors = true,
			style = {
				comments = {
					italic = true
				},
				keywords = {
					italic = true
				}
			}
		},
	},
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function() 
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true

			vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeOpen<CR>", { silent = true })

			require("nvim-tree").setup({
				auto_reload_on_write = true,
				sort_by = "case_sensitive",
				view = {
					width = 30
				},
				filters = {
					dotfiles = false
				}
			})
		end
	}
})
