return {
	"utilyre/barbecue.nvim",
	enabled = true,
	event = "User FileOpened",
	dependencies = { "SmiteshP/nvim-navic" },
	config = function()
		require("barbecue").setup({
			theme = "catppuccin",
			create_autocmd = true, -- prevent barbecue from updating itself automatically
			show_dirname = false,
			symbols = { separator = "➜" },
		})
	end,
}
