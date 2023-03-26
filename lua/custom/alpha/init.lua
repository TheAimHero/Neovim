return {
	"goolord/alpha-nvim",
	enabled = true,
	config = function()
		require("alpha").setup(require("custom.alpha.screen").opts)
	end,
}
