local vim = vim

local keymap_opts = {noremap = true}

-- 設定外掛 NERDTree 的快捷鍵
vim.api.nvim_set_keymap('n', '<F2>', ':NERDTreeToggle<CR>', keymap_opts)

-- 設定外掛 DoxygenToolkit.vim 可以使用 <F8> 插入函數的說明註解
vim.api.nvim_set_keymap('n', "<F8>", ":Dox<CR>", keymap_opts)

-- 設定外掛 telescope 使用 Ctrl + p 搜尋檔案
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", keymap_opts)

-- 設定外掛telescope 使用 Ctrl + f 全域搜尋
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope live_grep<CR>", keymap_opts)

