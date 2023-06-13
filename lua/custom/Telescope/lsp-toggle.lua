return {
	"adoyle-h/lsp-toggle.nvim",
	pin = true,
	branch = "master",
	keys = {
		{ " lt", "<cmd>Telescope ToggleLSP<cr>", desc = "Toggle Lsp" },
		{ " ln", "<cmd>Telescope ToggleNullLSP<cr>", desc = "Toggle Null-ls Lsp" },
	},
	config = function()
		require("lsp-toggle").setup({
			create_cmds = true, -- Whether to create user commands
			telescope = true, -- Whether to load telescope extensions
		})
	end,
}
