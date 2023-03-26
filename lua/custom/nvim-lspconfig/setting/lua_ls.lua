require("lspconfig").lua_ls.setup({
	on_attach = function(c, b)
		c.server_capabilities.documentFormattingProvider = false
		require("lsp_signature").on_attach({
			floating_window = false,
			hint_enable = true,
			hint_prefix = "",
		}, b)
		require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
	end,
	capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	log_level = 2,
	root_dir = function()
		return false
	end,
	single_file_support = true,
	settings = {
		Lua = {
			hint = { enable = true },
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim", "lvim" },
			},
			workspace = {},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})
