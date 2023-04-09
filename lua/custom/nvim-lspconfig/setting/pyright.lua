return function()
	require("lspconfig").pyright.setup({
		on_attach = function(c, b)
			require("lsp-inlayhints").on_attach(c, b)
			c.server_capabilities.documentFormattingProvider = false
			require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
		settings = {
			python = {
				-- analysis = {
				-- 	autoSearchPaths = true,
				-- 	useLibraryCodeForTypes = true,
				lsp_inlay_hints = {
					functionReturnTypes = true,
					variableTypes = true,
					-- },
				},
			},
		},
	})
end
