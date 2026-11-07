local status, mason = pcall(require, "mason")
if not status then
	vim.notify("Not found the plugin: mason")
	return
end

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	vim.notify("Not found the plugin: lspconfig")
	return
end

local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
	vim.notify("Not found the plugin: mason-lspconfig")
	return
end

mason.setup()
mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"lua_ls",
		"clangd",
		"cmake",
		"jsonls",
		"bashls",
		"yamlls",
		"pyright",
		"powershell_es",
		"roslyn_ls",
		"ruff",
		"mesonlsp",
		"lemminx",
		"marksman",
		"rust_analyzer",
	},
})

-- Tis is a callback function to set shortcuts for LSP.
local function LspKeyBind(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	require("keymaps").lspKeyBinding(buf_set_keymap)
end

-- Get the handler for auto completion.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.enable({
	"lua_ls",
	"clangd",
	"cmake",
	"jsonls",
	"bashls",
	"yamlls",
	"pyright",
	"powershell_es",
	"roslyn_ls",
	"mesonlsp",
	"lemminx",
	"marksman",
	"rust_analyzer",
})

-- For common lsp settings.
vim.lsp.config("*", {
	capabilities = capabilities,
	on_attach = LspKeyBind,
})

-- Change some settings for clangd.
vim.lsp.config.clangd.on_attach = LspKeyBind

-- Change some settings for pyright.
vim.lsp.config.pyright.settings = {
	pyright = {
		disableOrganizeImports = true,
	},
	python = {
		analysis = {
			ignore = { "*" },
		},
	},
}

-- Change some settings for roslyn_ls.
vim.lsp.config.roslyn_ls = {
	on_attach = LspKeyBind,
}

-- Change some settings for rust-analyzer.
vim.lsp.config.rust_analyzer = {
	on_attach = LspKeyBind,
	settings = {
		["rust-analyzer"] = {
			diagnostics = {
				enble = false,
			},
		},
	},
}
