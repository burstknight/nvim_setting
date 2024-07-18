local vim = vim

vim.cmd("let NERDTreeShowHidden = 1") 	-- 在 NERDTree 中顯示隱藏檔
vim.cmd("let NERDTreeMosueMode = 3") 	-- 在 NERDTree 中允許使用滑鼠點擊檔案和資料夾

vim.cmd("autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(\":quit\\<CR>:\\<BS>\") | endif")
