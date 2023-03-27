local keymap = vim.keymap.set

keymap("n", "\\b", function()
	vim.go.background = vim.go.background == "light" and "dark" or "light"
	vim.notify(string.format("Background = %s", vim.go.background))
end)

keymap("n", "\\w", function()
	vim.wo.wrap = not vim.wo.wrap
	vim.notify(string.format("Wrap = %s", vim.wo.wrap))
end)

keymap("n", "\\c", function()
	vim.wo.cursorline = not vim.wo.cursorline
	vim.notify(string.format("Cursorline = %s", vim.wo.cursorline))
end)

keymap("n", "\\s", function()
	vim.go.spell = not vim.go.spell
	vim.notify(string.format("Spell = %s", vim.go.spell))
end)

keymap("n", "\\a", "<cmd>ASToggle<CR>")

keymap("n", "\\l", function()
	local laststatus = vim.opt.laststatus:get()
	local status
	if laststatus == 0 then
		vim.opt.laststatus = 3
		status = "global"
    elseif laststatus == 3 then
		vim.opt.laststatus = 0
		status = "off"
	end
	vim.notify(string.format("statusline %s", status))
end)

keymap("n", "\\i", function()
	if vim.wo.signcolumn == "no" then
		vim.wo.signcolumn = "auto"
		vim.diagnostic.enable()
		vim.wo.number = true
	else
		vim.wo.signcolumn = "no"
		vim.wo.number = false
		vim.diagnostic.disable()
	end
	vim.notify(string.format("Signcolumn = %s", vim.wo.signcolumn))
end)
