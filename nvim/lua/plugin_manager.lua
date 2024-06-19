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
	-- 這個外掛可以當檔案總管來瀏覽一個專案目錄下的檔案
	{'preservim/nerdtree'},

	-- 可以配合 nerdtree 顯示每個檔案git的狀態
	{'Xuyuanp/nerdtree-git-plugin'},

	-- 這個外掛可以用來括號類符號的自動補齊
	{'jiangmiao/auto-pairs'},
	--
	-- 使用這兩個外掛來顯示vim的狀態列
	{'vim-airline/vim-airline'},
	{'vim-airline/vim-airline-themes'},

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

	-- 這個外掛專門用來管理 LSP server
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},

	-- 這些外掛可以用來處理自動補齊
	{'hrsh7th/nvim-cmp'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/cmp-path'},
	{'hrsh7th/cmp-cmdline'},
	{'hrsh7th/cmp-buffer'},
	{"/burstknight/friendly-snippets"},

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
})
