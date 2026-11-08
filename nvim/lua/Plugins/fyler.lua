local status, fyler = pcall(require, "fyler")
if not status then
	vim.notify("Not found the plugun: fyler.nvim")
	return
end

