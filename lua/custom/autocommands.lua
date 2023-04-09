local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

--Make alpha popup when no buffers remain
augroup("alpha_on_empty", { clear = true })
autocmd("User", {
	pattern = "BDeletePost*",
	group = "alpha_on_empty",
	callback = function(event)
		local fallback_name = vim.api.nvim_buf_get_name(event.buf)
		local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
		local fallback_on_empty = fallback_name == "" and fallback_ft == ""
		if fallback_on_empty then
			vim.cmd("Alpha")
			vim.cmd(event.buf .. "bwipeout")
		end
	end,
})

--Disable mini on some filetype
augroup("No_Mini", { clear = true })
autocmd({ "FileType" }, {
	pattern = M.disable_table,
	group = "No_Mini",
	callback = function()
		vim.b.miniindentscope_disable = true
		vim.b.minicursorword_disable = true
		vim.b.minijump_disable = true
	end,
})

--Persistent folds
local save_fold = augroup("Persistent Folds", { clear = true })
autocmd("BufWinLeave", {
	pattern = "*.*",
	callback = function()
		vim.cmd.mkview()
	end,
	group = save_fold,
})

autocmd("BufWinEnter", {
	pattern = "*.*",
	callback = function()
		vim.cmd.loadview({ mods = { emsg_silent = true } })
		vim.cmd("delm!")
		vim.cmd("lua require('null-ls').disable('cspell')")
		vim.cmd("delm!")
	end,
	group = save_fold,
})

-- Persistent Cursor
autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

augroup("_file_opened", { clear = true })
autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
	group = "_file_opened",
	once = true,
	callback = function(args)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
		if not (vim.fn.expand("%") == "" or buftype == "nofile") then
			vim.cmd("do User FileOpened")
		end
	end,
})

local function is_directory(path)
	local stat = vim.loop.fs_stat(path)
	return stat and stat.type == "directory" or false
end

augroup("_dir_opened", { clear = true })
autocmd("BufEnter", {
	group = "_dir_opened",
	once = true,
	callback = function(args)
		local bufname = vim.api.nvim_buf_get_name(args.buf)
		if is_directory(bufname) then
			vim.api.nvim_del_augroup_by_name("_dir_opened")
			vim.cmd("do User DirOpened")
			vim.api.nvim_exec_autocmds("BufEnter", {})
		end
	end,
})
