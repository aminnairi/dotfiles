vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.number = true
vim.o.relativenumber = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

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
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		keys = {
			{ "<c-n>", "<cmd>NvimTreeOpen<cr>", silent = true, desc = "Open the file tree" }
		},
		config = function() 
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			vim.opt.termguicolors = true

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
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files (without hidden nor ignored files)" },
			{ "<leader>fw", "<cmd>Telescope live_grep<CR>", desc = "Find words" },
			{ "<leader>fc", "<cmd>Telescope find_colorschemes<CR>", desc = "Find color schemes" },
		},
		config = function()
			require("telescope").setup({})
		end
	},
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 0
			require("which-key").setup({})
		end
	}
})
