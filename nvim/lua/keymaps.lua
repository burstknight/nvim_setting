local map = vim.api.nvim_set_keymap
local cmd = vim.cmd

local status, utils = pcall(require, "Utils.init")
if not status then
	vim.notify("Not found the module: utils.init")
	return
end

local opts = {noremap = true, silent = true}
local buffer_ops = {noremap = true, silent = true, buffer = bufnr}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- 設定外掛 NERDTree 的快捷鍵
map('n', '<F2>', ':CHADopen<CR>', opts)

-- 設定外掛 DoxygenToolkit.vim 可以使用 <F8> 插入函數的說明註解
map('n', "<F8>", ":Dox<CR>", opts)

-- 設定 terminal 相關的快捷鍵
local defualt_shell = ""
if "Windows" == utils.get_platform() then
	defualt_shell = "pwsh.exe"
end
map("t", "<C-k>", "<C-\\><C-n>", opts)

-- 設定外掛 vim-snip 可以使用 TAB 和 S-TAB 在編輯片斷時轉跳
cmd("imap <expr> <TAB> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<TAB>'")
cmd("smap <expr> <TAB> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<TAB>'")
cmd("imap <expr> <S-TAB> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-next)' : '<S-TAB>'")
cmd("smap <expr> <S-TAB> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-next)' : '<S-TAB>'")

-- 設定 dap 快捷鍵
local which_key = require("which-key")

local wk_keymaps = {
	-- For DAP
    { "<leader>d", group = "DAP", nowait = false, remap = false },
    { "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Breakpoint", nowait = false, remap = false },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", desc = "Continue", nowait = false, remap = false },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<CR>", desc = "Disconnect", nowait = false, remap = false },
    { "<leader>dn", "<cmd>lua require'dap'.step_over()<CR>", desc = "Next", nowait = false, remap = false },
    { "<leader>dq", "<cmd>lua require'dap'.close()<CR>", desc = "Quit", nowait = false, remap = false },
    { "<leader>ds", "<cmd>lua require'dap'.step_into()<CR>", desc = "Step", nowait = false, remap = false },
    { "<leader>dx", "<cmd>lua require'dap'.terminate()<CR>", desc = "Terminate", nowait = false, remap = false },

	-- For MarkdownPreview
	{"<leader>m", group = "MarkdownPreview", nowait = false, remap = false},
    { "<leader>mp", "<cmd>MarkdownPreview<CR>", desc = "Markdown preview", nowait = false, remap = false },
    { "<leader>ms", "<cmd>MarkdownPreviewStop<CR>", desc = "Markdown preview stop", nowait = false, remap = false },
    { "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown preview toggle", nowait = false, remap = false },

	{"<leader>G", "<cmd>Gitignore<CR>", desc = "Generate '.gitignore'"},

	-- For leetcode.nvim
	{"<leader>L", group = "LeetCode", nowait = false, remap = false},
	{"<leader>LL", "<cmd>Leet<CR>", desc = "Open leetcode.nvim", nowait = false, remap = false},
	{"<leader>Lq", "<cmd>Leet exit<CR>", desc = "Close leetcode.nvim", nowait = false, remap = false},
	{"<leader>Lm", "<cmd>Leet menu<CR>", desc = "Return leet code menu", nowait = false, remap = false},
	{"<leader>Ld", "<cmd>Leet daily<CR>", desc = "Open the question of today", nowait = false, remap = false},
	{"<leader>Ll", "<cmd>Leet list<CR>", desc = "Open a problem list picker", nowait = false, remap = false},
	{"<leader>LR", "<cmd>Leet random<CR>", desc = "Open a random question", nowait = false, remap = false},
	{"<leader>Lr", "<cmd>Leet run<CR>", desc = "Run currently opened question", nowait = false, remap = false},
	{"<leader>La", "<cmd>Leet lang<CR>", desc = "Change the language", nowait = false, remap = false},
	{"<leader>Ls", "<cmd>Leet submit<CR>", desc = "Submit currently opened question", nowait = false, remap = false},

	-- For telescope
	{"<leader>f", group = "Telescope", nowait = false, remap = false},
	{"<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find the file", nowait = false, remap = false},
	{"<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Globally find file with keyword", nowait = false, remap = false},
	{"<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Globally find file with keyword", nowait = false, remap = false},
	{"<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Find the recent file", nowait = false, remap = false},

	-- For terminal
	{"<leader>t", group = "Terminal", nowait = false, remap = false},
	{"<leader>tf", "<cmd>Lspsaga term_toggle " .. defualt_shell .. "<CR>", desc = "Open a floating terminal", nowait = false},
	{"<leader>tv", ":vsplit +terminal<CR>", desc = "Vertically open a terminal.", nowait = false},
	{"<leader>ts", ":split +terminal<CR>", desc = "Horizontally open a terminal.", nowait = false},
	{"<leader>tt", ":tab terminal<CR>", desc = "Open a tab terminal.", nowait = false},
}

which_key.add(wk_keymaps)

local pluginKeys = {}

-- 設定 LSP 快捷鍵
pluginKeys.lspKeyBinding = function(mapbuf)
	mapbuf("n", "<leader>lr", ":Lspsaga rename<CR>", opts)
	mapbuf("n", "<leader>la", ":Lspsaga code_action<CR>", opts)
	mapbuf("n", "<leader>ld", ":lua vim.lsp.buf.definition()<CR>", opts)
	mapbuf("n", "<leader>lf", ":Lspsaga finder def+ref+imp<CR>", opts)
	mapbuf("n", "<F3>", ":Lspsaga outline<CR>", opts)
	mapbuf("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", opts)
	mapbuf("n", "<leader>l=", "<cmd>Format<CR>", opts)
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
