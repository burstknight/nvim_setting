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

local pluginKeys = {}

-- 設定 LSP 快捷鍵
pluginKeys.lspKeyBinding = function(mapbuf)
	mapbuf("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", keymap_opts)
	mapbuf("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", keymap_opts)
	mapbuf("n", "gd", ":lua vim.lsp.buf.definition()<CR>", keymap_opts)
	mapbuf("n", "<F9>", ":lua vim.lsp.buf.hover()<CR>", keymap_opts)
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
