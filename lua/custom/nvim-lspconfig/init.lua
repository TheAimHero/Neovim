return {
	require("custom.nvim-lspconfig.neodev"),
	require("custom.nvim-lspconfig.nvim_lspconfig"),
	require("custom.nvim-lspconfig.mason"),
	require("custom.nvim-lspconfig.mason-lspconfig"),
	require("custom.nvim-lspconfig.null-ls"),
	require("custom.nvim-lspconfig.mason-null-ls"),
	require("custom.nvim-lspconfig.inlay_hints"),
	require("custom.nvim-lspconfig.rust-tools"),
	require("custom.lightbulb"),
	{
		"ray-x/lsp_signature.nvim",
		enabled = true,
		lazy = true,
		config = function()
			require("lsp_signature").setup({
				floating_window = false,
				hint_enable = true,
				hint_prefix = "",
			})
		end,
	},
	{
		"b0o/schemastore.nvim",
		ft = "json",
	},
	{
		"ErichDonGubler/lsp_lines.nvim",
		enabled = true,
		lazy = true,
		config = function()
			require("lsp_lines").setup()
			vim.cmd("lua require('lsp_lines').toggle()")
		end,
	},
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
		config = function()
			vim.g.code_action_menu_show_details = true
			vim.g.code_action_menu_show_diff = true
			vim.g.code_action_menu_show_action_kind = true
		end,
	},
}
