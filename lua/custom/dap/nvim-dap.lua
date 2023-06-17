local dap = require("dap")

-- Cpp dap configurations
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = "${fileDirname}//a.out",
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
}

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

--Javascript configurations
dap.configurations.javascript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = "${workspaceFolder}",
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
}

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { "/home/Vedant/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}
