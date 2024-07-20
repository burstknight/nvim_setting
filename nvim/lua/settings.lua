local vim = vim

-- 關閉 netrw
 vim.g.loaded_netrw = 1
 vim.g.loaded_netrwPlugin = 1

 -- 開啟支援 24 位元彩色
 vim.opt.termguicolors = true

 if vim.fn.exists("g:os") == 0 then
 	local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
	if is_windows then
		vim.g.os = "Windows"
	else
		local uname_output = vim.fn.system("uname")
		vim.g.os = string.gsub(uname_output, "\n", " ")
	end
 end


 if "Windows" == vim.g.os then
 	vim.cmd("let g:python3_host_prog=\"~/.pyenv/pyenv-win/shims/python\"")
 end

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
