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
	-- 使用 nvim-tree 來當作檔案總管
	{'kyazdani42/nvim-tree.lua', event = "VimEnter", dependencies = "nvim-tree/nvim-web-devicons"},

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
})

