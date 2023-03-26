return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"jose-elias-alvarez/null-ls.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvim-lua/plenary.nvim",
		{ "folke/neodev.nvim", ft = "lua", config = true },
		{
			"lvimuser/lsp-inlayhints.nvim",
			lazy = true,
			config = function()
				require("lsp-inlayhints").setup({
					inlay_hints = {
						highlight = "Comment",
					},
					enabled_at_startup = true,
					debug_mode = false,
				})
			end,
		},
		{ "ray-x/lsp_signature.nvim", lazy = true },
	},
	config = function()
		require("lspconfig")
		require("custom.nvim-lspconfig.mason")
		require("custom.nvim-lspconfig.handlers").setup()
		require("custom.nvim-lspconfig.null-ls")
	end,
}
