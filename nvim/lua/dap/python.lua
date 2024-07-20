local dap = require("dap")
dap.adapters.python = {
	type = "executable",
	command = "python",
	args = {"-m", "debugpy.adapter"},
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "launch python file",
		program = "${file}",
		pythonPath = function ()
			local cwd = vim.fn.getcwd()
			if 1 == vim.fn.executable(cwd .. "/venv/bin/python") then
				return cwd .. "/venv/bin/python"
			elseif 1 == vim.fn.executable(cwd .. "/.venv/bin/python") then
				return cwd .. "/.venv/bin/python"
			elseif 1 == vim.fn.executable(cwd .. "/.env/bin/python") then
				return cwd .. "/.env/bin/python"
			else
				return "/usr/bin/python3"
			end
		end,
	},
}
