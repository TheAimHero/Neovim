local keymap = vim.keymap.set

keymap("n", "\\b", function()
	vim.go.background = vim.go.background == "light" and "dark" or "light"
	vim.notify(string.format("Background = %s", vim.go.background), "info", { title = "Ui" })
end)

keymap("n", "\\w", function()
	vim.wo.wrap = not vim.wo.wrap
	vim.notify(string.format("Wrap = %s", vim.wo.wrap), "info", { title = "Ui" })
end)

keymap("n", "\\c", function()
	vim.wo.cursorline = not vim.wo.cursorline
	vim.notify(string.format("Cursorline = %s", vim.wo.cursorline), "info", { title = "Ui" })
end)

keymap("n", "\\s", function()
	vim.wo.spell = not vim.wo.spell -- local to window
	vim.notify(string.format("spell %s", vim.wo.spell), "info", { title = "Spell" })
end)

keymap("n", "\\a", "<cmd>ASToggle<CR>")

local state_quickscope = true
keymap("n", "\\q", function()
	vim.cmd("QuickScopeToggle")
	state_quickscope = not state_quickscope
	vim.notify(string.format("Quick Scope %s", state_quickscope), "info", { title = "QuickScope" })
end)

local state_lsp_lines = true
keymap("n", "\\d", function()
	vim.cmd("lua require('lsp_lines').toggle()")
	state_lsp_lines = not state_lsp_lines
	vim.notify(string.format("Lsp Lines %s", state_lsp_lines), "info", { title = "Lsp Lines" })
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
