local map = vim.api.nvim_set_keymap

local keymap_opts = {noremap = true}

-- 設定 nvim-tree 快捷鍵
map('n', "<F2>", ":NvimTreeToggle<CR>", keymap_opts)

-- 設定外掛 DoxygenToolkit.vim 可以使用 <F8> 插入函數的說明註解
map('n', "<F8>", ":Dox<CR>", keymap_opts)

