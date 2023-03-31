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
		vim.cmd("lua require('null-ls').disable('cspell')")
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

--OpenMarkdownPreview in new firefox window
-- vim.cmd([[
-- function OpenMarkdownPreview (url)
--   execute "silent ! pidof firefox || firefox & sleep 1 && firefox " . a:url
-- endfunction
-- ]])
-- vim.g.mkdp_browserfunc = "OpenMarkdownPreview"

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

-- autocmd("BufEnter", {
-- 	desc = "Open Neo-Tree on startup with directory",
-- 	group = augroup("neotree_start", { clear = true }),
-- 	callback = function()
-- 		if package.loaded["neo-tree"] then
-- 			vim.api.nvim_del_augroup_by_name("neotree_start")
-- 		else
-- 			local stats = vim.loop.fs_stat(vim.api.nvim_buf_get_name(0))
-- 			if stats and stats.type == "directory" then
-- 				require("neo-tree")
-- 				vim.api.nvim_del_augroup_by_name("neotree_start")
-- 				vim.api.nvim_exec_autocmds("BufEnter", {})
-- 			end
-- 		end
-- 	end,
-- })
