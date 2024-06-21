local dapui = require("dapui")
dapui.setup({})

local dap = require("dap")
dap.listeners.after.event_initialize["dapui_config"] = function ()
	dapui.open({})
end

dap.listeners.before.event_terminated["dapui_config"] = function ()
	dapui.close({})
end

dap.listeners.before.event_exited["dapui_config"] = function ()
	dapui.close({})
end
