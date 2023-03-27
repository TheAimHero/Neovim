return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUninstall" },
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
