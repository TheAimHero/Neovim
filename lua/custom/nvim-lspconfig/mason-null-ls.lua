return {
	"jay-babu/mason-null-ls.nvim",
	config = function()
		require("mason-null-ls").setup({
			automatic_setup = true,
		})
		-- require("custom.nvim-lspconfig.null-ls") -- require your null-ls config here (example below)
	end,
}
