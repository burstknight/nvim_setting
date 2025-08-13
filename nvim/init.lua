-- 載入基本的設定
require("settings")

-- 載入所有的外掛
require("plugin_manager")

-- 載入快捷鍵的設定
require("keymaps")

-- 載入主題設定
require("theme")

-- 載入所有外掛的設定檔
local plugins = {
	"Plugins.nvim-notify",
	"Plugins.chadtree",
	"Plugins.vim-gitgutter",
	"Plugins.vim-rainbow",
	"Plugins.ibl",
	"Plugins.gitignore",
	"Plugins.startup",
	"Plugins.leetcode",
	"Plugins.lualine"
}

for i = 1, #plugins do
	local isOk, msg = pcall(require, plugins[i])
	if false == isOk then
		print("Failed to load the plugin setting: " .. plugins[i] .. "\nReason: " .. msg)
	end
end

-- Include settings for lsp.
require("Lsp.init")

-- Include settings for dap.
require("Dap.init")
