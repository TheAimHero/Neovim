return function()
	require("lspconfig").jsonls.setup({
		on_attach = function(c, b)
			-- NOTE: Uncomment to enable inlay hints
			require("lsp-inlayhints").on_attach(c, b)
			c.server_capabilities.documentFormattingProvider = false
			require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
		end,
		capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
			},
		},
	})
end
