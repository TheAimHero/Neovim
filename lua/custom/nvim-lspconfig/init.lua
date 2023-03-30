return {
	require("custom.nvim-lspconfig.neodev"),
	require("custom.nvim-lspconfig.nvim_lspconfig"),
  require("custom.nvim-lspconfig.mason-null-ls"),
	require("custom.nvim-lspconfig.null-ls"),
	require("custom.nvim-lspconfig.inlay_hints"),
	{ "ray-x/lsp_signature.nvim", lazy = true },
}
