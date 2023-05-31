return {
	"akinsho/bufferline.nvim",
	event = "User FileOpened",
	config = function()
		local mocha = require("catppuccin.palettes").get_palette("mocha")
		require("bufferline").setup({})
	end,
}
