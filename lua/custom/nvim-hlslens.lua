return {
	"kevinhwang91/nvim-hlslens",
	lazy = true,
	keys = { { "/", mode = { "n", "v" } }, { "?", mode = { "n", "v" } } },
	config = function()
		require("hlslens").setup({ calm_down = true })

		local kopts = { noremap = true, silent = true }
	end,
}
