return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	lazy = true,
	version = false,
	dependencies = {
		"mason.nvim",
		"mason-lspconfig.nvim",
	},
}
