local vim = vim

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- 這個外掛可以當檔案總管來瀏覽一個專案目錄下的檔案
Plug 'preservim/nerdtree'

vim.call('plug#end')
