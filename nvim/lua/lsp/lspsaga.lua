local status, lspsaga = pcall(require, "lspsaga")
if not status then
	vim.notify("Not found the plugin: lspsaga")
	return
end

lspsaga.setup({
	outline = {
		keys = {
			jump = "<CR>",
		},
	},
})

