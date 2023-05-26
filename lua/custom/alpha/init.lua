return {
	"goolord/alpha-nvim",
	enabled = true,
	event = "VimEnter",
	config = function()
		require("alpha").setup(require("custom.alpha.screen").opts)
	end,
}
