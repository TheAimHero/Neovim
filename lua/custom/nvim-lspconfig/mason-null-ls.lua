return {
	"jay-babu/mason-null-ls.nvim",
	cmd = { "NullLsInstall", "NullLsUninstall" },
	config = function()
		require("mason-null-ls").setup({
			automatic_setup = true,
		})
	end,
}
