return {
	"williamboman/mason-lspconfig.nvim",
	cmd = { "LspInstall", "LspUninstall" },
	config = function()
		require("mason-lspconfig").setup({
			automatic_installation = false,
		}) -- Add ensure install table
    require("custom.nvim-lspconfig.servers")
	end,
}
