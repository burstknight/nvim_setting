local cmd = vim.cmd

local theme = "codedark"
local isOk, msg = pcall(cmd, "colorscheme " .. theme)
if false == isOk then
	print("Failed to set the theme: " .. theme .. "\n\tReason: " .. msg)
end
