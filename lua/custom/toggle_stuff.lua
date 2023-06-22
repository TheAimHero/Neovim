local keymap = vim.keymap.set

local color = "Catppuccin Mocha"
keymap("n", "\\b", function()
	vim.cmd("Lazy load onedarkpro.nvim")
	if color == "Catppuccin Mocha" then
		vim.cmd("colorscheme onedark_dark")
		color = "OneDarkPro Dark"
	else
		vim.cmd("colorscheme catppuccin-mocha")
		color = "Catppuccin Mocha"
	end
	vim.notify("Color Scheme: " .. color, "info", { title = "Ui" })
end)

keymap("n", "\\w", function()
	vim.wo.wrap = not vim.wo.wrap
	vim.notify(string.format("Wrap  %s", vim.wo.wrap), "info", { title = "Ui" })
end)

keymap("n", "\\c", function()
	vim.wo.cursorline = not vim.wo.cursorline
	vim.notify(string.format("Cursorline  %s", vim.wo.cursorline), "info", { title = "Ui" })
end)

keymap("n", "\\s", function()
	vim.wo.spell = not vim.wo.spell -- local to window
	vim.notify(string.format("spell %s", vim.wo.spell), "info", { title = "Spell" })
end)

local codeium = true
keymap("n", "\\a", function()
	if codeium then
		vim.cmd("Codeium DisableBuffer")
	else
		vim.cmd("Codeium EnableBuffer")
	end
	codeium = not codeium
	vim.notify(string.format("Codeium %s", codeium), "info", { title = "Codeium" })
end)

local gitsigns = true
keymap("n", "\\g", function()
	vim.cmd("Gitsigns toggle_signs")
	gitsigns = not gitsigns
	vim.notify(string.format("Gitsigns %s", gitsigns), "info", { title = "Gitsigns" })
end)

-- NOTE: Does not work at the properly at the moment
local inlay_hints = true
keymap("n", "\\h", function()
	local bufnr = vim.api.nvim_buf_get_number(vim.api.nvim_get_current_buf())
	vim.lsp.buf.inlay_hint(bufnr)
	inlay_hints = not inlay_hints
	vim.notify(string.format("Inlay Hints %s", inlay_hints), "info", { title = "Inlay Hints" })
end)

local eyeliner = true
keymap("n", "\\e", function()
	vim.cmd("EyelinerToggle")
	eyeliner = not eyeliner
	vim.notify(string.format("Eyeliner %s", eyeliner), "info", { title = "Eyeliner" })
end)

local state_cmp = true
keymap("n", "\\l", function()
	if state_cmp then
		vim.cmd(":lua require('cmp').setup.buffer { enabled = false }")
	else
		vim.cmd(":lua require('cmp').setup.buffer { enabled = true }")
	end
	state_cmp = not state_cmp
	vim.notify(string.format("Completion %s", state_cmp), "info", { title = "Completion" })
end)

local state_indentline = true
keymap("n", "\\i", function()
	vim.cmd("IndentBlanklineToggle")
	state_indentline = not state_indentline
	vim.notify(string.format("Indent Lines %s", state_indentline), "info", { title = "IndentBlankline" })
end)

local state_lsp_lines = false
keymap("n", "\\d", function()
	vim.cmd("lua require('lsp_lines').toggle()")
	state_lsp_lines = not state_lsp_lines
	vim.notify(string.format("Lsp Lines %s", state_lsp_lines), "info", { title = "Lsp Lines" })
end)

local state_colorizer = false
keymap("n", "\\z", function()
	vim.cmd("ColorizerToggle")
	state_colorizer = not state_colorizer
	vim.notify(string.format("Colorizer %s", state_colorizer), "info", { title = "Colorizer" })
end)

keymap("n", "\\C", function()
	local res = vim.api.nvim_exec("set colorcolumn?", true)
	if string.find(res, "80") then
		vim.cmd("set colorcolumn=")
	else
		vim.cmd("set colorcolumn=80")
	end
	vim.notify(string.format("Colorcolumn %s", vim.wo.colorcolumn), "info", { title = "Ui" })
end)
