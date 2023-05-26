-- return {
-- 	"unblevable/quick-scope",
-- 	event = "User FileOpened",
-- 	config = function()
-- 		vim.cmd([[
--       highlight QuickScopePrimary guifg='#00C7DF' gui=nocombine ctermfg=155 cterm=nocombine
--       highlight QuickScopeSecondary guifg='#f84e03' gui=nocombine ctermfg=81 cterm=nocombine
--       let g:qs_max_chars=150
--       let g:qs_buftype_blacklist = ["terminal", "nofile","quickfix","help","prompt","git"]
--       let g:qs_filetype_blacklist = ["alpha","Outline","neo-tree","lazy","fugitive","Trouble"]
--       ]])
-- 	end,
-- }

return {
	"jinh0/eyeliner.nvim",
	event = "User FileOpened",
	config = function()
		require("eyeliner").setup({
			highlight_on_key = false, -- show highlights only after keypress
			dim = false, -- dim all other characters if set to true (recommended!)
		})
		vim.api.nvim_set_hl(0, "EyelinerPrimary", { fg = "#00c7df", bold = true })
		vim.api.nvim_set_hl(0, "EyelinerSecondary", { fg = "#f84e03", bold = true })
	end,
}
