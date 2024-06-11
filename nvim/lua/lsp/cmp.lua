local status, cmp = pcall(require, "cmp")
if not status then
	vim.notify("Not found the plugin: cmp")
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = require("keymaps").cmpKeys(cmp),
	sources = cmp.config.sources({
		{name = "nvim_lsp"},
		{name = "vsnip"},
		{name = "buffer"},
	}),
})

