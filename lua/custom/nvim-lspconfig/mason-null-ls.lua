return {
	"jay-babu/mason-null-ls.nvim",
	version = false,
	lazy = true,
	cmd = { "NullLsInstall", "NullLsUninstall" },
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = nil,
			automatic_installation = true,
			automatic_setup = true,
			handlers = {},
		})
	end,
}
