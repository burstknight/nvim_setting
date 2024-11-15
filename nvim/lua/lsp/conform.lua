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
		cs = {"clang-format"},
	},
	format_on_save = false,
})

vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

vim.api.nvim_create_user_command("Format", function (args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = {args.line1, 0},
			["end"] = {args.line2, end_line:len()},
		}
	end
	conform.format({
		async = true,
		lsp_format = "falback",
		range = range
	})
end, {range = true})
