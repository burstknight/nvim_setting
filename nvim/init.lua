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
	"plugins.nvim-notify",
	"plugins.nerdtree",
	"plugins.vim-gitgutter",
	"plugins.vim-rainbow",
	"plugins.ibl",
	"plugins.gitignore",
}

for i = 1, #plugins do
	local isOk, msg = pcall(require, plugins[i])
	if false == isOk then
		print("Failed to load the plugin setting: " .. plugins[i] .. "\nReason: " .. msg)
	end
end

-- 載入 mason 的設定以便管理LSP
require("lsp.mason")


require("lsp.cmp")
require("lsp.lspkind")
require("lsp.lspsaga")
require("lsp.ui")
require("lsp.tiny-inline-diagnostic")
require("lsp.conform")
require("lsp.mason-conform")

require("dap.python")
require("dap.dapui")
require("dap.dap-virtual-text")
require("dap.mason-nvim-dap")
require("dap.cpp")
