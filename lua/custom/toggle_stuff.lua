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
	vim.notify(string.format("spell %s", vim.wo.spell), "info", { title = "Ui" })
end)

keymap("n", "\\a", "<cmd>ASToggle<CR>")
