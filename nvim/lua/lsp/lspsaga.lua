local status, lspsaga = pcall(require, "lspsaga")
if not status then
	vim.notify("Not found the plugin: lspsaga")
	return
end

lspsaga.setup({
	finder = {
		keys = {
			vsplit = "v",
			split = "s",
			toggle_or_open = "o",
		},
	},
	outline = {
		keys = {
			jump = "<CR>",
		},
	},
})

