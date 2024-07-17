local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

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

-- 設定外掛 vim-snip 可以使用 TAB 和 S-TAB 在編輯片斷時轉跳
cmd("imap <expr> <TAB> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<TAB>'")
cmd("smap <expr> <TAB> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<TAB>'")
cmd("imap <expr> <S-TAB> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-next)' : '<S-TAB>'")
cmd("smap <expr> <S-TAB> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-next)' : '<S-TAB>'")

-- 設定 dap 快捷鍵
local which_key = require("which-key")

local wk_keymaps = {
    { "<leader>d", group = "DAP", nowait = false, remap = false },
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Breakpoint", nowait = false, remap = false },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue", nowait = false, remap = false },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<CR>", desc = "Disconnect", nowait = false, remap = false },
    { "<leader>dn", "<cmd>lua require'dap'.step_over()<CR>", desc = "Next", nowait = false, remap = false },
    { "<leader>dq", "<cmd>lua require'dap'.close()<CR>", desc = "Quit", nowait = false, remap = false },
    { "<leader>ds", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step", nowait = false, remap = false },
    { "<leader>dx", "<cmd>lua require'dap'.terminate()<CR>", desc = "Terminate", nowait = false, remap = false },
    { "<leader>mp", "<cmd>MarkdownPreview<CR>", desc = "Markdown preview", nowait = false, remap = false },
    { "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", desc = "Markdown preview stop", nowait = false, remap = false },
    { "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown preview toggle", nowait = false, remap = false },
}

which_key.add(wk_keymaps)

local pluginKeys = {}

-- 設定 LSP 快捷鍵
pluginKeys.lspKeyBinding = function(mapbuf)
	mapbuf("n", "<leader>gr", ":Lspsaga rename<CR>", opts)
	mapbuf("n", "<leader>ga", ":Lspsaga code_action<CR>", opts)
	mapbuf("n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", opts)
	mapbuf("n", "<leader>gf", ":Lspsaga finder def+ref+imp<CR>", opts)
	mapbuf("n", "<F3>", ":Lspsaga outline<CR>", opts)
	mapbuf("n", "<leader>gh", "<cmd>Lspsaga hover_doc<CR>", opts)
	mapbuf("n", "<leader>=", ":lua vim.lsp.buf.format {async = true}<CR>", opts)
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
		}),
	}

	return keys
end

return pluginKeys
