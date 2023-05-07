return {
	"debugloop/telescope-undo.nvim",
  commit="03ff45fab0c4adad4d252e25b5b194e22caf5b4f",
	dependencies = "telescope.nvim",
	keys = { { " su", "<cmd>Telescope undo<cr>", desc = "Undo History" } },
	config = function()
		require("telescope").setup({
			extensions = {
				undo = {
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
