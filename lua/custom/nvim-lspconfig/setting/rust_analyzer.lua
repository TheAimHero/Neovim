return function()
	require("lspconfig").rust_analyzer.setup({
		on_attach = function(c, b)
			vim.lsp.buf.inlay_hint(b, true)
			c.server_capabilities.documentFormattingProvider = true
			require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		-- FIX: Does not work find a fix to make the capabilities work
		-- capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
		settings = {
			["rust-analyzer"] = {
				filetypes = { "rust" },
				standalone = true,
				diagnostics = { enable = false },
			},
		},
	})
end
