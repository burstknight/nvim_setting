local status, peek = pcall(require, "peek")
if not status then
	vim.notify("Not found the plugin: peek.nvim")
	return
end

peek.setup({
	theme = 'dark',
	app = "browser",
})

vim.api.nvim_create_user_command('PeekOpen', peek.open, {})
vim.api.nvim_create_user_command('PeekClose', peek.close, {})
