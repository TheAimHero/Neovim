return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	config = function()
		require("zen-mode").setup({
			window = {
				width = 1,
				options = { statuscolumn = "  ", signcolumn = "no", number = false, relativenumber = false },
				on_open = function() end,
				on_close = function() end,
			},
		})
	end,
}
