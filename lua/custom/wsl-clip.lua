if vim.fn.has("wsl") then
	return {
		"Konfekt/vim-wsl-copy-paste",
		event = "VeryLazy",
		enabled = false,
	}
else
	return {}
end
