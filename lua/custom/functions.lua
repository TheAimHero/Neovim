M = {}

M.Auto_save = function()
	return function()
		vim.cmd("echo 'configok'")
	end
end

M.squire = function(name)
	return function()
		require("custom." .. name)
	end
end

local function sleep(n)
	local t = os.clock()
	while os.clock() - t <= n do
	end
end

M.Preview_md = function()
	vim.api.nvim_exec("silent !firefox --new-window", true)
end

M.New = function()
	local name = ""
	local pwd = vim.api.nvim_exec("echo expand('%:p:h')", true)
	vim.ui.input({ prompt = "Enter new file name : " }, function(input)
		name = input
	end)
	if not name or string.len(name) == 0 then
		vim.cmd("echo 'Empty file name '")
		return
	else
		vim.cmd("enew")
		pcall(vim.cmd, "w " .. pwd .. "/" .. name)
		return
	end
end

M.Run = function()
	local args, name, type, command
	name = vim.api.nvim_exec("echo expand('%:t')", true)
	type = vim.api.nvim_exec("echo expand('%:e')", true)
	if string.len(name) == 0 then
		return
	end
	vim.ui.input({ prompt = "Enter arguments : " }, function(input)
		args = input
	end)
	if type == "cpp" then
		command = ("g++ " .. name .. " " .. args .. " && ./a.out")
	elseif type == "py" then
		command = "python3 " .. name .. " " .. args
	elseif type == "js" then
		command = "node " .. name .. " " .. args
	else
		print("Wrong file type")
		return
	end
	sleep(4)
	vim.cmd("ToggleTerm size=75 direction=vertical")
	vim.cmd("TermExec go_back=0 cmd='" .. command .. "'")
end

M.disable_table = {
	"toggleterm",
	"DiffviewFileHistory",
	"diff",
	"DiffviewFiles",
	"lazy",
	"mason",
	"Trouble",
	"Outline",
	"fugitive",
	"git",
	"alpha",
	"TelescopPrompt",
	"help",
	"man",
	"terminal",
	"qf",
}

local function file_bool(name)
	for _, value in ipairs(M.disable_table) do
		if string.find(name, value) then
			return true
		end
	end
	return false
end

M.Del = function()
	local name_file = vim.api.nvim_exec("set filetype?", true)
	local status
	if file_bool(name_file) then
		vim.cmd("q")
	else
		status = pcall(vim.cmd, "Bdelete")
	end
	if status == false then
		vim.cmd("echo '  save the file first  '")
	end
end

M.try = function()
	print(vim.fn.has("wsl"))
end

return M
