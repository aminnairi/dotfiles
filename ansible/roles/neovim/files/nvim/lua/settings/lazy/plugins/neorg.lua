return {
	"nvim-neorg/neorg",
	build = ":Neorg sync-parsers",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/which-key",
	},
	init = function()
		-- Configure the key to use for keybinds used in the "core.keybinds" module
		vim.g.maplocalleader = ","
	end,
	config = function()
		require("neorg").setup({
			load = {
				-- Default module that imports the core modules necessary for Neorg
				["core.defaults"] = {},
				-- Module responsible for enhancing the icons display in Neorg files
				["core.concealer"] = {
					-- Configuration for the "core.concealer" module
					config = {
						-- Configure icons for concealed items
						icons = {
							-- Configure the headings
							heading = {
								-- List of icons to use for all headings levels from 1 to 6
								icons = {
									"◉",
									"◎",
									"○",
									"◉",
									"◎",
									"○",
								},
							},
						},
					},
				},
				["core.dirman"] = {
					-- Configuration for "core.dirman" module
					config = {
						-- Workspaces are folders from where to find Neorg files
						workspaces = {
							-- My personal notes
							notes = "~/git/github.com/aminnairi/notes",
						},
					},
				},
				-- Module for controling the presentation mode for Neorg files
				["core.presenter"] = {
					-- Configuration for the presenter module
					config = {
						-- Plugin to use, here "folke/zen-mode"
						zen_mode = "zen-mode",
					},
				},
			},
		})

		require("which-key").register({
			["<leader>o"] = {
				name = "Neorg",
				p = {
					name = "Presenter",
					s = {
						":Neorg presenter start",
						"Start",
					},
					S = {
						":Neorg presenter stop",
						"Stop",
					},
				},
			},
		})
	end,
}
