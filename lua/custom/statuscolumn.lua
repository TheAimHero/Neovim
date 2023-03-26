local M = {}
_G.Status = M

---@return {name:string, text:string, texthl:string}[]
function M.get_signs()
	local buf = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
	return vim.tbl_map(function(sign)
		return vim.fn.sign_getdefined(sign.name)[1]
	end, vim.fn.sign_getplaced(buf, { group = "*", lnum = vim.v.lnum })[1].signs)
end

function M.column()
	local sign, git_sign, dap
	for _, s in ipairs(M.get_signs()) do
		if s.name:find("GitSign") then
			git_sign = s
		elseif s.name:find("Dap") then
			dap = s
		else
			sign = s
		end
	end
	local components = {
		sign and ("%#" .. sign.texthl .. "#" .. sign.text .. "%*") or "",
		dap and ("%#" .. dap.texthl .. "#" .. dap.text .. "%*") or "",
		[[%=]],
		[[%{&nu?(&rnu&&v:relnum?v:relnum:v:lnum):''} ]],
		git_sign and ("%#" .. git_sign.texthl .. "#" .. git_sign.text .. "%*") or " ",
	}
	return table.concat(components, "")
end

if vim.fn.has("nvim-0.9.0") == 1 then
  vim.opt.statuscolumn = [[%!v:lua.Status.column()]]
end

return M
