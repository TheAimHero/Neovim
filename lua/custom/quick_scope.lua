return {

	"unblevable/quick-scope",
	event = "User FileOpened",
	config = function()
		vim.cmd([[
      highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
      highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline
      let g:qs_max_chars=150
      let g:qs_buftype_blacklist = ["terminal", "nofile","quickfix","help","prompt","git"]
      let g:qs_filetype_blacklist = ["alpha","Outline","neo-tree","lazy","fugitive","Trouble"]
      ]])
	end,
}
