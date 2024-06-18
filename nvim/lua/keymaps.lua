local map = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = true}
local buffer_ops = {noremap = true, silent = true, buffer = bufnr}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 設定外掛 NERDTree 的快捷鍵
map('n', '<F2>', ':NERDTreeToggle<CR>', opts)

-- 設定外掛 DoxygenToolkit.vim 可以使用 <F8> 插入函數的說明註解
map('n', "<F8>", ":Dox<CR>", opts)

-- 設定外掛 telescope 使用 Ctrl + p 搜尋檔案
map("n", "<C-p>", ":Telescope find_files<CR>", opts)

-- 設定外掛telescope 使用 Ctrl + f 全域搜尋
map("n", "<C-f>", ":Telescope live_grep<CR>", opts)

-- 設定 terminal 相關的快捷鍵
map("n", "<leader>t", "<cmd>Lspsaga term_toggle<CR>", buffer_ops)
map("t", "<C-k>", "<C-\\><C-n>", opts)

local pluginKeys = {}

-- 設定 LSP 快捷鍵
pluginKeys.lspKeyBinding = function(mapbuf)
	mapbuf("n", "<leader>rn", ":Lspsaga rename<CR>", opts)
	mapbuf("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
	mapbuf("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", opts)
	mapbuf("n", "<F3>", ":Lspsaga outline<CR>", opts)
	mapbuf("n", "<leader>h", "<cmd>Lspsaga hover_doc<CR>", opts)
end

pluginKeys.cmpKeys = function(cmp)
	local keys = {
		["<A-j>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
		["<A-k>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<TAB>"] = cmp.mapping.select_next_item(),
		["<S-TAB>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			behavior = cmp.ConfirmBehavior.Replace,
		}),
	}

	return keys
end

return pluginKeys
