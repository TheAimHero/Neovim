local lspconfig = require("lspconfig")
lspconfig.tsserver.setup({
	on_attach = function(c, b)
		require("lsp-inlayhints").on_attach(c, b)
		require("lsp_signature").on_attach({
			floating_window = false,
			hint_enable = true,
			hint_prefix = "",
		}, b)
		c.server_capabilities.documentFormattingProvider = false
		require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
	end,
	capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
	root_dir = function()
		return false
	end,
	settings = {
		javascript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = false,
			},
		},
		typescript = {
			inlayHints = {
				includeInlayEnumMemberValueHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
				includeInlayParameterNameHintsWhenArgumentMatchesName = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayVariableTypeHints = true,
			},
		},
	},
})
