local status, nvim_treesitter = pcall(require, "nvim-treesitter")
if not status then
	vim.notify("Not found the plugin: nvim-treesitter")
	return
end

nvim_treesitter.setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"markdown",
		"markdown_inline",
		"bash",
		"c",
		"cpp",
		"cmnake",
		"dockerfile",
		"doxygen",
		"git_config",
		"git_rebase",
		"gitcommit",
		"gitignore",
		"json",
		"make",
		"python",
		"toml",
		"xml",
		"yaml",
		"ini",
		"http",
	},
	auto_install = true,
	sync_install = false,
	highlight = {
		enable = true,
	},
})
