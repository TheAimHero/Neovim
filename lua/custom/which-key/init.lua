return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("custom.which-key.which-key")
		require("custom.which-key.whichkey_functions")
		require("custom.which-key.whichkey_maps")
	end,
}
