local dap = require("dap")
dap.set_log_level("TRACE")

local function getDebugBinPath()
	local get_platform = require("utils.init").get_platform
	if "Windows" == get_platform() then
		return vim.fn.expand("~/scoop/apps/netcoredbg/current/netcoredbg.exe")
	else
		return vim.fn.expand(vim.fn.stdpath("data") .. "/mason/packages/netcoredbg/netcoredbg")
	end
end

dap.adapters.coreclr = {
	type = "executable",
	command = getDebugBinPath(),
	args = {
		"--interpreter=vscode",
	},
}

dap.configurations.cs = {
	{
		type = "coreclr",
		name = "launch - netcoredbg",
		request = "launch",
		program = function()
			local build_output = vim.fn.systemlist("dotnet build -c Debug")
			local dotnet_last_dll_path = ""
			for _, line in pairs(build_output) do
				vim.notify("Build file path: `" .. line .. "`")
				if line:match(".dll") then
					dotnet_last_dll_path = line
					break
				end
			end
			local _, end_index = string.find(dotnet_last_dll_path, "-> ")
			dotnet_last_dll_path = string.sub(dotnet_last_dll_path, end_index + 1)
			dotnet_last_dll_path = string.gsub(dotnet_last_dll_path, "\r", "")
			vim.notify("Dll path: `" .. dotnet_last_dll_path .. "`")
			return dotnet_last_dll_path
		end,
	},
}
