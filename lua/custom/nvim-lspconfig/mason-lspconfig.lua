return {
	"williamboman/mason-lspconfig.nvim",
	enabled = true,
	cmd = { "LspInstall", "LspUninstall" },
	config = function()
		require("mason-lspconfig").setup({
			automatic_installation = false,
		})
		--settings for auto setup of servers
		require("custom.nvim-lspconfig.handlers").setup()
		require("mason-lspconfig").setup_handlers({

			function(server_name)
				require("lspconfig")[server_name].setup({
					---@diagnostic disable-next-line: unused-local
					on_attach = function(c, b)
						require("custom.nvim-lspconfig.handlers").lsp_keymaps(b)
					end,
					capabilities = require("custom.nvim-lspconfig.handlers").capabilities,
				})
			end,

			["tsserver"] = require("custom.nvim-lspconfig.setting.tsserver"),
			["tailwindcss"] = require("custom.nvim-lspconfig.setting.tailwindcss"),
			["html"] = require("custom.nvim-lspconfig.setting.html"),
			["lua_ls"] = require("custom.nvim-lspconfig.setting.lua_ls"),
			["pyright"] = require("custom.nvim-lspconfig.setting.pyright"),
			["clangd"] = require("custom.nvim-lspconfig.setting.clangd"),
			["jsonls"] = require("custom.nvim-lspconfig.setting.jsonls"),
			["rust_analyzer"] = require("custom.nvim-lspconfig.setting.rust_analyzer"),
		})
	end,
}
