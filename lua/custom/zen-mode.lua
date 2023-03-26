return {
	"folke/zen-mode.nvim",
	cmd = "ZenMode",
	config = function()
		require("zen-mode").setup({
			window = {
				width = 1,
				options = { statuscolumn = "  ", signcolumn = "no", number = false, relativenumber = false },
				on_open = function()
					require("barbecue.ui").toggle(false)
				end,
				on_close = function()
					require("barbecue.ui").toggle(true)
				end,
			},
		})
	end,
}
