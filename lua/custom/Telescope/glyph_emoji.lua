return {

	"xiyaowong/telescope-emoji.nvim",
	dependencies = { "ghassan0/telescope-glyph.nvim", "telescope.nvim" },
	keys = {
		{ " ue", "<cmd>Telescope emoji<cr>", desc = "emoji" },
		{ " ug", "<cmd>Telescope glyph<cr>", desc = "glyph" },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				emoji = {
					action = function(emoji)
						vim.fn.setreg("*", emoji.value)
						---@diagnostic disable-next-line: param-type-mismatch
						vim.notify([[Press p or "*p to paste this emoji]] .. emoji.value, "info", { title = "Emoji" })
						-- insert emoji when picked
						vim.api.nvim_put({ emoji.value }, "c", false, true)
					end,
				},
				glyph = {
					action = function(glyph)
						vim.fn.setreg("*", glyph.value)
						---@diagnostic disable-next-line: param-type-mismatch
						vim.notify([[Press p or "*p to paste this glyph]] .. glyph.value, "info", { title = "Glyph" })
						-- insert glyph when picked
						vim.api.nvim_put({ glyph.value }, "c", false, true)
					end,
				},
			},
		})
		require("telescope").load_extension("emoji")
		require("telescope").load_extension("glyph")
	end,
}
