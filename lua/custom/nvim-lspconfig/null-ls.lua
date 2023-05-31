return {
	"jose-elias-alvarez/null-ls.nvim",
	lazy = true,
	config = function()
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		local code_actions = null_ls.builtins.code_actions

		null_ls.setup({
			debug = true,
			border = "single",

			sources = {
				diagnostics.cspell.with({
					diagnostics_postprocess = function(diagnostic)
						diagnostic.severity = vim.diagnostic.severity.HINT
					end,
				}),

				formatting.prettierd.with({ disabled_filetypes = { "html" } }),
				-- code_actions.gitsigns,
			},
		})
		require("mason-null-ls").setup()
	end,
}
