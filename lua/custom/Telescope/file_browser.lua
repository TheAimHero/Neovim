return {
	"nvim-telescope/telescope-file-browser.nvim",
	keys = { { " e", "<cmd>Telescope file_browser<cr>", desc = "file_browser" } },
	dependencies = { "telescope.nvim" },
	config = function()
		require("telescope").setup({
			extensions = {
				file_browser = {
					theme = "ivy",
					initial_mode = "normal",
					sorting_strategy = "descending",
					cwd_to_path = false,
					path = "%:p:h",
					hidden = true,
					hijack_netrw = true,
				},
			},
		})
		require("telescope").load_extension("file_browser")
	end,
}
