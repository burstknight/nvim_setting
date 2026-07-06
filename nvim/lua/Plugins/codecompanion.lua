local status, codecompanion = pcall(require, "codecompanion")
if not status then
	vim.notify("Not found the plugin: codecompanion")
	return
end

codecompanion.setup({
	opts = {
		log_level = "DEBUG",
	},
})
