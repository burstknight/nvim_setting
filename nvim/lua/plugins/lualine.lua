local status, lualine = pcall(require, "lualine")
if not status then
	vim.notify("Not found the plugin: lualine")
end

lualine.setup({
	options = {
		theme = "onedark",
	},
	refresh = {
		statusline = 500,
		tabline = 500,
		winbar = 500,
	},
})
