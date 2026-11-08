-- Load all settings for the plugins.
local plugins = {
	"Plugins.nvim-notify",
	"Plugins.vim-gitgutter",
	"Plugins.vim-rainbow",
	"Plugins.ibl",
	"Plugins.gitignore",
	"Plugins.startup",
	"Plugins.leetcode",
	"Plugins.lualine",
	"Plugins.codecompanion",
	"Plugins.img-clip",
	"Plugins.fidget",
	"Plugins.mini-icons",
	"Plugins.nvim-treesitter",
	"Plugins.fyler",
}

for i = 1, #plugins do
	local isOk, msg = pcall(require, plugins[i])
	if false == isOk then
		print("Failed to load the plugin setting: " .. plugins[i] .. "\nReason: " .. msg)
	end
end
