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
		"marksman",
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
	"omnisharp",
	"mesonlsp",
	"lemminx",
	"marksman",
})

-- For common lsp settings.
vim.lsp.config("*", {
	capabilities = capabilities,
	on_attach = LspKeyBind,
})

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

-- Change omnisharp executable file path for cross-platform.
local get_platform = require("utils.init").get_platform

local omnisharp_bin = ""
if "Windows" == get_platform() then
	omnisharp_bin = vim.fn.expand("~/scoop/apps/omnisharp/current/OmniSharp.exe")
else
	omnisharp_bin = vim.fn.expand(vim.fn.stdpath("data") .. "/mason/bin/omnisharp")
end

vim.lsp.config.omnisharp.cmd = {
	omnisharp_bin,
	"-z",
	"--hostPID",
	"12345",
	"DotNet:enablePackageRestore=false",
	"--encoding",
	"utf-8",
	"--languageserver",
}
