return {
	"folke/trouble.nvim",
	cmd = "TroubleToggle",
	config = function()
		require("trouble").setup({
			position = "right",
			width = 45,
			use_diagnostic_signs = true,
			auto_close = true,
			auto_fold = false,
		})
	end,
}