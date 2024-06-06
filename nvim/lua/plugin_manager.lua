local vim = vim

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

-- 這個外掛可以當檔案總管來瀏覽一個專案目錄下的檔案
Plug 'preservim/nerdtree'

-- 這個外掛可以用來括號類符號的自動補齊
Plug 'jiangmiao/auto-pairs'

-- 使用這兩個外掛來顯示vim的狀態列
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

vim.call('plug#end')
