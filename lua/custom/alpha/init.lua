return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		require("alpha").setup(require("custom.alpha.screen").opts)
	end,
}
