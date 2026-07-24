local status, mini_icons = pcall(require, "mini.icons")
if not status then
	vim.notify("Not found the plugin: mini.icons")
	return
end

mini_icons.setup()
