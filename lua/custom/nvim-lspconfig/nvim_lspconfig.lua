return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	lazy = true,
	version = false,
	dependencies = {
		"mason.nvim",
		"lsp_signature.nvim",
		"mason-lspconfig.nvim",
	},
}
