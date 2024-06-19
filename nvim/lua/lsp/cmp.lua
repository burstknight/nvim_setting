local status, cmp = pcall(require, "cmp")
if not status then
	vim.notify("Not found the plugin: cmp")
	return
end

local lspkind = require("lspkind")
local types = require("cmp.types")
local str = require("cmp.utils.str")

cmp.setup({
	-- 設定 snippet 引擎
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = require("keymaps").cmpKeys(cmp),

	-- 設定自動補齊的來源
	sources = cmp.config.sources({
		{name = "nvim_lsp"},
		{name = "vsnip"},
		{name = "buffer"},
		{name = "path"},
	}),

	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 20,
			ellipsis_char = "...",
			before = function (entry, vim_item)
				local word = entry:get_insert_text()
				if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
					word = vim.lsp.util.parse_snippet(word)
				end

				word = str.oneline(word)
				if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat and string.sub(vim_item.abbr, -1, -1 == "~") then
					word = word .. "~"
				end

				vim_item.abbr = word
				return vim_item
			end
		}),
	},
})

-- 在使用`/`這個指令搜尋時會輔助做自動補齊
cmp.setup.cmdline({"/", }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{name = "buffer"},
	}
})

-- 在使用`:`指令時會使用path和cmdline幫忙做自動補齊
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{name = "path"},
	}, {
		{name = "cmdline"}
	}),
	matching = {disallow_symbol_nonprefix_matching = false},
})

