local status, nvim_treesitter = pcall(require, "nvim-treesitter")
if not status then
	vim.notify("Not found the plugin: nvim-treesitter")
	return
end

nvim_treesitter.install({
	"lua",
	"vim",
	"vimdoc",
	"markdown",
	"markdown_inline",
	"bash",
	"c",
	"cpp",
	"c_sharp",
	"cmake",
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
	"powershell",
	"gdscript",
	"godot_resource",
	"rust",
})
