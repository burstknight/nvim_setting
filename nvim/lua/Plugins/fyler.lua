local status, fyler = pcall(require, "fyler")
if not status then
	vim.notify("Not found the plugun: fyler.nvim")
	return
end

fyler.setup({
	kind = "split_left_most",
	extensions = {
		git = {
			enabled = true,
			inline = true,
		},
		watcher = {
			enabled = true,
		},
	},
	integrations = {
		icon = "mini_icons",
	},
	kind_presets = {
		split_left_most = {
			width = "40%",
		},
	},
	ui = {
		indent_guides = true,
	},
})
