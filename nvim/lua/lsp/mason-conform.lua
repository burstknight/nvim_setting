local status, mason_conform = pcall(require, "mason-conform")
if not status then
	vim.notify("Not found the plugin: mason-conform")
end

mason_conform.setup({
})
