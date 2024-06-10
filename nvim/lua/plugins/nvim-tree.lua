local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("Not found the plugin: nvim-tree")
	return
end

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return {desc = "mvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true}
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set('n', "?", api.tree.toggle_help, opts("Help"))
end

nvim_tree.setup({
	sort_by = "case_sensitive",

	-- 顯示 git 變更狀態
	git = {
		enable = true,
	},

	-- 過慮檔案
	filters = {
		dotfiles = false,
		custom = {},
	},

	view = {
		-- 檔案總管顯示在左側
		side = "left",
		number = false,
		relativenumber = false,

		-- 顯示圖示
		signcolumn = "yes",
		width = 30,
	},

	renderer = {
		group_empty = true,
	},

	on_attach = on_attach,
})

