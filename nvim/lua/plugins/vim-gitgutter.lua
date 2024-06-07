local vim = vim

-- 設定每隔 100ms 檢查一次檔案的修改狀態
vim.cmd("set updatetime=100")

-- 使用藍色顯示新增的內容
vim.cmd("highlight GitGutterAdd ctermfg=blue")

-- 使用綠色顯示修改的內容
vim.cmd("highlight GitGutterChange ctermfg=green")

-- 使用紅色顯示刪除的內容
vim.cmd("highlight GitGutterDelete ctermfg=red")
