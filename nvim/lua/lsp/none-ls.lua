local status, null_ls = pcall(require, "null-ls")
if not status then
	vim.notify("Not found the plugin: null-ls")
	return
end

null_ls.setup({
})
