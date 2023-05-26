return {
	"lvimuser/lsp-inlayhints.nvim",
	branch = "anticonceal",
	lazy = true,
	-- NOTE: Enable inlay hints in the respective server configuration in order to use it to use it
	enabled = false,
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
