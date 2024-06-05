local vim = vim

local keymap_opts = {noremap = true}

-- 設定外掛 NERDTree 的快捷鍵
vim.api.nvim_set_keymap('n', '<F2>', ':NERDTreeToggle<CR>', keymap_opts)

