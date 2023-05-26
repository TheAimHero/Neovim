return {
	"luukvbaal/statuscol.nvim",
	event = "User FileOpened",
	enabled = true,
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup({
			setopt = true,
			thousands = false,
			relculright = false,
			ft_ignore = { "Outline", "Trouble", "neo-tree" },
			bt_ignore = nil,
			segments = {
				{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
				{ sign = { name = { "Marks", "Dap" }, maxwidth = 1, colwidth = 2, auto = true } },
				{ text = { builtin.lnumfunc, " " }, condition = { true, builtin.not_empty } },
				{ sign = { name = { "GitSigns" }, maxwidth = 1, colwidth = 2, auto = true } },
			},
			clickhandlers = {
				Lnum = false,
				FoldClose = builtin.foldclose_click,
				FoldOpen = builtin.foldopen_click,
				FoldOther = builtin.foldother_click,
				DapBreakpointRejected = false,
				DapBreakpoint = false,
				DapBreakpointCondition = false,
				DiagnosticSignError = false,
				DiagnosticSignHint = false,
				DiagnosticSignInfo = false,
				DiagnosticSignWarn = false,
				GitSignsTopdelete = false,
				GitSignsUntracked = false,
				GitSignsAdd = false,
				GitSignsChange = false,
				GitSignsChangedelete = false,
				GitSignsDelete = false,
			},
		})
	end,
}
