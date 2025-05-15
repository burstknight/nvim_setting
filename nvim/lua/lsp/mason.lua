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
		"omnisharp",
		"ruff",
		"mesonlsp",
		"lemminx",
	},
})

-- Tis is a callback function to set shortcuts for LSP.
local function LspKeyBind(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	require("keymaps").lspKeyBinding(buf_set_keymap)
end

-- 取得 handler 可以在自動補齊函數時還會額外提供更多資訊
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
	"omnisharp",
	"mesonlsp",
	"lemminx",
})

-- 設定 lua lsp
vim.lsp.config.lua_ls = {
	capabilities = capabilities,
	on_attach = LspKeyBind,
}

-- 設定clangd
vim.lsp.config.clangd = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
}

-- 設定 lsp 可以支援 cmake
vim.lsp.config.cmake = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
}

-- 設定 lsp 可以支援 json
vim.lsp.config.jsonls = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
}

-- 設定 lsp 可以支援 bash
vim.lsp.config.bashls = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
}

-- 設定 lsp 可以支援 yaml
vim.lsp.config.yamlls = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
}

-- 設定 lsp 使用 pyright 支援 python
vim.lsp.config.pyright = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = { "*" },
			},
		},
	},
}

-- 設定 lsp 支援 powershell
vim.lsp.config.powershell_es = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
}

-- 設定 lsp 支援 godot
vim.lsp.config.gdscript = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
}

-- 設定 lsp 支援 c#
local get_platform = require("utils.init").get_platform

local omnisharp_bin = ""
if "Windows" == get_platform() then
	omnisharp_bin = vim.fn.expand("~/scoop/apps/omnisharp/current/OmniSharp.exe")
else
	omnisharp_bin = vim.fn.expand(vim.fn.stdpath("data") .. "/mason/bin/omnisharp")
end

vim.lsp.config.omnisharp = {
	cmd = {
		omnisharp_bin,
		"-z",
		"--hostPID",
		"12345",
		"DotNet:enablePackageRestore=false",
		"--encoding",
		"utf-8",
		"--languageserver",
	},
	on_attach = LspKeyBind,
	capabilities = capabilities,
}

-- 設定 lsp 支援 meson
vim.lsp.config.mesonlsp = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
}

-- 設定 lsp 支援 xml
vim.lsp.config.lemminx = {
	on_attach = LspKeyBind,
	capabilities = capabilities,
}
