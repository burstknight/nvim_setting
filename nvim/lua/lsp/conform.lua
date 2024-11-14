local status, conform = pcall(require, "conform")
if not status then
	vim.notify("Not found the plugin: conform")
	return
end

conform.setup({
	formatters_by_ft = {
		lua = {"stylua"},
		cpp = {"clang-format"},
		c = {"clang-format"},
		python = {"isort", "ruff_format"},
	},
	format_on_save = false,
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
