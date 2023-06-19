return {
	"nvim-treesitter/nvim-treesitter",
	version = false,
	build = ":TSUpdate",
	cmd = { "TSInstall", "TSUpdate", "TSUninstall", "TSInstallInfo" },
	event = { "User FileOpened" },
	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"comment",
				"javascript",
				"cpp",
				"python",
				"html",
				"css",
				"lua",
				"bash",
				"mermaid",
			},
			-- sync_install = true,
			highlight = { enable = true, additional_vim_regex_highlighting = false },
			indent = { enable = true },
			autotag = {
				enable = true,
				enable_rename = true,
				enable_close = true,
				enable_close_on_slash = true,
				filetypes = { "html", "xml", "javascript", "javascriptreact", "typescript", "typescriptreact" },
			},
			incremental_selection = { enable = true },
		})
	end,
}
