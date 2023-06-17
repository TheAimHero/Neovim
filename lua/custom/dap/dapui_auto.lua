local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local signs = {
	Breakpoint = "",
	BreakpointCondition = "",
	BreakpointRejected = "",
}

for type, icon in pairs(signs) do
	local hl = "Dap" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = "DiagnosticSignError", numhl = "" })
end

vim.fn.sign_define("DapStopped", { text = "", texthl = "DiagnosticSignOk", numhl = "" })

--dapui
dapui.setup({
	icons = { expanded = " ", collapsed = " ", current_frame = " " },
	controls = {
		icons = {
			pause = " ",
			play = " ",
			step_into = " ",
			step_over = " ",
			step_out = " ",
			step_back = " ",
			run_last = " ",
			terminate = " ",
		},
	},
})
