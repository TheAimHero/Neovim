return {
	"debugloop/telescope-undo.nvim",
	dependencies = "telescope.nvim",
	keys = { { " su", "<cmd>Telescope undo<cr>", desc = "Undo History" } },
	config = function()
		require("telescope").setup({
			extensions = {
				undo = {
					side_by_side = false,
					mappings = {
						i = {
							["<cr>"] = require("telescope-undo.actions").yank_additions,
							["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
							["<C-u>"] = require("telescope-undo.actions").restore,
						},
						n = {
							["<cr>"] = require("telescope-undo.actions").yank_additions,
							["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
							["<C-u>"] = require("telescope-undo.actions").restore,
						},
					},
				},
			},
		})
		require("telescope").load_extension("undo")
	end,
}
