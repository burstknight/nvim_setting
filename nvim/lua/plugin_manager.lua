local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- 這個外掛可以美化 neovim 的通知訊息
	{"rcarriga/nvim-notify"},

	-- 這個外掛可以當檔案總管來瀏覽一個專案目錄下的檔案
	{
		"ms-jpq/chadtree",
		branch = "chad",
		build = "python -m chadtree deps",
	},

	-- 這個外掛可以用來括號類符號的自動補齊
	{'jiangmiao/auto-pairs'},
	--
	-- 使用這兩個外掛來顯示vim的狀態列
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {'nvim-tree/nvim-web-devicons'},
	},

	-- 可以和 git 搭配及時顯示當前檔案的修改狀態
	{'airblade/vim-gitgutter'},

	-- 這個外掛可以產生Doxygen格式的註解
	{'vim-scripts/DoxygenToolkit.vim'},

	-- 主題外掛
	{'tomasiser/vim-code-dark'},

	-- 可以使用多個不同顏色來顯示巢狀式括號
	{'frazrepo/vim-rainbow'},

	-- 這個外掛可以用來模糊搜尋檔案
	{'nvim-telescope/telescope.nvim'},
	{'nvim-treesitter/nvim-treesitter'},
	{'nvim-lua/plenary.nvim'},

	-- 設定LSP
	{'neovim/nvim-lspconfig'},

	{"rachartier/tiny-inline-diagnostic.nvim", event = "VeryLazy", commit = "b4a76ef"},

	-- 這個外掛專門用來管理 LSP server
	{"burstknight/mason.nvim", branch = "master"},
	{"williamboman/mason-lspconfig.nvim"},
	{"mason-org/mason-registry"},

	-- 這個外掛可以格式化程式碼
	{"stevearc/conform.nvim"},

	-- 這個外掛可以自動化安裝用來格式化程式碼所需的套件
	{"zapling/mason-conform.nvim"},

	-- 這些外掛可以用來處理自動補齊
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'hrsh7th/cmp-buffer'},
	{"burstknight/friendly-snippets", branch = "master"},

	-- 使用 vsnip 處理自動補齊
	{'hrsh7th/cmp-vsnip'},
	{'hrsh7th/vim-vsnip'},

	-- 這個外掛可以用來顯示縮排
	{"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}},

	-- 這個外掛可以用來優化 lsp 在自動補齊選單的圖示
	{"onsails/lspkind.nvim"},

	-- 這個外掛可提升 lsp 的使用體驗
	{"nvimdev/lspsaga.nvim", dependencies = {"nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons"}},

	-- 這個外掛可以在寫程式時顯示出函式的原型
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function (_, opts)
			require("lsp_signature").setup(opts)
		end
	},

	-- 這個外掛專門用來處理 dap
	{"mfussenegger/nvim-dap"},
	{"theHamsta/nvim-dap-virtual-text"},
	{"nvim-neotest/nvim-nio"},
	{"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}},
	{"jay-babu/mason-nvim-dap.nvim"},

	-- 這個外掛可以管理快捷鍵
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function ()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = {"MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop"},
		build = "cd app && yarn install",
		init = function ()
			vim.g.mkdp_filetupes = {"markdown"}
		end,
		ft = {"markdown"},
	},

	-- 這個外掛可以輔助輸入.gitignore
	{"wintermute-cell/gitignore.nvim"},

	-- 這個外掛可以在開啟 neovim 時顯示歡迎畫面
	{
		"startup-nvim/startup.nvim", 
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},

	-- 這個外掛可以在 neovim 上刷 leetcode
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
			"rcarriga/nvim-notify",
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- 這個外掛可以會用底線凸顯出游標所在的文字
	{"itchyny/vim-cursorword"},

	-- 這個外掛可以用來管理 dotnet 專案
	{
		"MoaidHathot/dotnet.nvim",
		cmd = "DotnetUI",
	}
})
