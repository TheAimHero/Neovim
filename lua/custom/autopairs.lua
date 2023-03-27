return {
	"windwp/nvim-autopairs",
	event = "User FileOpened",
	enabled = false,
	config = function()
		require("nvim-autopairs").setup({})
	end,
}
