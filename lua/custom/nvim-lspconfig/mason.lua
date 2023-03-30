return {
	"williamboman/mason.nvim",
	version = false,
	cmd = { "Mason", "MasonInstall", "MasonUninstall" },
	build = ":MasonUpdate",
	config = function()
		require("mason").setup({
			ui = {
				border = "single",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			log_level = vim.log.levels.INFO,
			max_concurrent_installers = 4,
		})
	end,
}
