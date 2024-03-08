return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	opts = {
		automatic_instalation = true,
		ensure_installed = {
			"cssls",
			"cssmodules_ls",
			"dockerls",
			"elmls",
			"eslint",
			"intelephense",
			"jsonls",
			"lua_ls",
			"marksman",
			"prismals",
			"rust_analyzer",
			"tsserver",
			"vuels",
			"yamlls",
		},
	},
}
