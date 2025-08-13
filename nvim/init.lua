-- 載入基本的設定
require("settings")

-- 載入所有的外掛
require("plugin_manager")

-- 載入快捷鍵的設定
require("keymaps")

-- 載入主題設定
require("theme")

-- Load all settings for the plugins.
require("Plugins.init")

-- Include settings for lsp.
require("Lsp.init")

-- Include settings for dap.
require("Dap.init")
