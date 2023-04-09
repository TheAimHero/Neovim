return {

	"unblevable/quick-scope",
	event = "User FileOpened",
	config = function()
		vim.cmd([[
      highlight QuickScopePrimary guifg='#00C7DF' gui=nocombine ctermfg=155 cterm=nocombine
      highlight QuickScopeSecondary guifg='#f84e03' gui=nocombine ctermfg=81 cterm=nocombine
      let g:qs_max_chars=150
      let g:qs_buftype_blacklist = ["terminal", "nofile","quickfix","help","prompt","git"]
      let g:qs_filetype_blacklist = ["alpha","Outline","neo-tree","lazy","fugitive","Trouble"]
      ]])
	end,
}
