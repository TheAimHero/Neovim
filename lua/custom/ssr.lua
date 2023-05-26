return {
	"cshuaimin/ssr.nvim",
	lazy = true,
  enabled=false,
	keys = { { " ur", "<cmd>lua require('ssr').open()<cr>" } },
	-- keymap({ "n", "x" }, "<leader>ur", function()
	--   require("ssr").open()
	-- end, opts)
	config = function()
		require("ssr").setup({
			border = "single",
			min_width = 50,
			min_height = 5,
			max_width = 120,
			max_height = 25,
			keymaps = {
				close = "q",
				next_match = "n",
				prev_match = "N",
				replace_confirm = "<cr>",
				replace_all = "<leader><cr>",
			},
		})
	end,
}
