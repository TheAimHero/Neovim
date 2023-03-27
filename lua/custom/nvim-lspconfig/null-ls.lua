return {
	"jose-elias-alvarez/null-ls.nvim",
	lazy = true,
	config = function()
		local null_ls = require("null-ls")
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		local formatting = null_ls.builtins.formatting
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		local diagnostics = null_ls.builtins.diagnostics

		local code_actions = null_ls.builtins.code_actions

		null_ls.setup({
			debug = true,
			border = "single",
			--add your sources here after install with mason
			sources = {
				formatting.clang_format.with({
					-- extra_args = { "-style=file:/home/Vedant/Dotfiles/SavedFiles/clang-format.txt" },
					filetypes = { "cpp" },
				}),
				formatting.stylua, --lua formatting
				formatting.beautysh, --shell formatting
				formatting.prettierd, --markdown html css formatting
				formatting.fourmolu, --haskell formatting
				formatting.yapf,

				diagnostics.cspell.with({
					--General spell check
					diagnostics_postprocess = function(diagnostic)
						diagnostic.severity = vim.diagnostic.severity.HINT
					end,
				}),

				-- code_actions.gitsigns,
				code_actions.eslint_d,
			},
		})
	end,
}
