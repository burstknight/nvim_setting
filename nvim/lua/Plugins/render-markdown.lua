local status, render_markdown = pcall(require, "render-markdown")
if not status then
	vim.notify("Not found the plugin: render-markdown")
	return
end

render_markdown.setup({
	completions = {
		lsp = {
			enabled = true,
		},
	},
})
