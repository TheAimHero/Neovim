return {
	"lvimuser/lsp-inlayhints.nvim",
  -- NOTE: After upgrading to 0.10.0
	-- branch = "anticonceal",
	lazy = true,
	-- NOTE: Enable inlay hints in the respective server configuration in order to use it to use it
	enabled = true,
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
