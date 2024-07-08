local status, conform = pcall(require, "conform")
if not status then
	vim.notify("Not found the plugin: conform")
	return
end

conform.setup({})
