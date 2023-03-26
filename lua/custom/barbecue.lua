return {
	"utilyre/barbecue.nvim",
	event = "BufReadPost",
	dependencies = { "SmiteshP/nvim-navic" },
	config = function()
		-- vim.api.nvim_create_autocmd({
		-- 	"WinScrolled", -- or WinResized on NVIM-v0.9 and higher
		-- 	"BufWinEnter",
		-- 	"CursorHold",
		-- 	"InsertLeave",
		--
		-- 	-- include these if you have set `show_modified` to `true`
		-- 	"BufWritePost",
		-- 	"TextChanged",
		-- 	"TextChangedI",
		-- }, {
		-- 	group = vim.api.nvim_create_augroup("barbecue.updater", {}),
		-- 	callback = function()
		-- 		require("barbecue.ui").update()
		-- 	end,
		-- })
		--
		require("barbecue").setup({
    theme = "catppuccin",
			create_autocmd = true, -- prevent barbecue from updating itself automatically
			show_dirname = false,
			symbols = { separator = "➜" },
		})
	end,
}
