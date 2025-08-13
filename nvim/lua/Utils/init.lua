local M = {}

-- We can use this function to get the platform on the current computer.
-- @return string Return the current running platform.
function M.get_platform()
	local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has(win16) == 1
	local sPlatform = ""
	if is_windows then
		sPlatform = "Windows"
	else
		local uname_output = vim.fn.system("uname")
		sPlatform = string.gsub(uname_output, "\n", " ")
	end

	return sPlatform
end

return M
