local dap = require("dap")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = vim.fn.stdpath("data") .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}


local function getRunCodeFile()
	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
end

dap.configurations.cpp = {
	{
		name = "Debug with cpptools",
		type = "cppdbg",
		request = "launch",
		program = getRunCodeFile,
		cwd = "${workspaceFolder}",
		stopOnEntry = true,
	},
	{
		name = "Attach to gdb server: 9999",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:9999",
		minDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = getRunCodeFile,
	},
}

dap.configurations.c = dap.configurations.cpp
