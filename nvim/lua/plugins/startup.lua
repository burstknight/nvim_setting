local status, startup = pcall(require, "startup")
if not status then
	vim.notify("Not found the plugin: startup.nvim")
end

startup.setup({
	theme = "dashboard",
})
