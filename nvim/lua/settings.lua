local vim = vim

vim.o.nu = true 				-- 顯示行數
vim.o.tabstop = 4 				-- 設定按下 tab 鍵時產生4格空白字元
vim.o.shiftwidth = 4 			-- 設定自動縮排對齊寬度為4格
vim.o.mouse = "a" 				-- 設定可以用滑鼠選取文字
vim.o.encoding = "utf-8" 		-- 設定使用 utf-8 來顯示讀取的檔案
vim.o.fileencoding = "utf-8" 	-- 使用 utf-8 來儲存檔案
vim.o.linebreak = true 			-- 如果一行的文字過長，就將其拆行顯示在下一行
vim.o.showbreak = ">>" 			-- 設定拆行的接續符號
vim.o.cursorline = true 		-- 凸顯出游標所在的行
vim.o.cursorcolumn = true 		-- 凸顯出游標所在的某一行的位置
