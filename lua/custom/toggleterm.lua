return {
	"akinsho/toggleterm.nvim",
	cmd = "ToggleTerm",
	dependencies = { require("custom.flatten") },
	config = function()
		require("toggleterm").setup({ autochdir = true, float_opts = { border = "single" } })
	end,
}
