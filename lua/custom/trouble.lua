return {
	"folke/trouble.nvim",
	cmd = "TroubleToggle",
	config = function()
		require("trouble").setup({
			padding = false,
			-- position = "right",
			-- width = 25,
			use_diagnostic_signs = true,
			auto_close = true,
			auto_fold = false,
			action_keys = {},
		})
	end,
}
