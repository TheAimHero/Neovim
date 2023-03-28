return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	lazy = true,
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		require("custom.nvim-lspconfig.mason"),
		require("custom.nvim-lspconfig.mason-lspconfig"),
	},
}
