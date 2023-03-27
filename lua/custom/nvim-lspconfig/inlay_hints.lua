return {
	"lvimuser/lsp-inlayhints.nvim",
	lazy = true,
	config = function()
		require("lsp-inlayhints").setup({
			inlay_hints = {
				highlight = "Comment",
			},
			enabled_at_startup = true,
			debug_mode = false,
		})
	end,
}
