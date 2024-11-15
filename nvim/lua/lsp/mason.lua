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
		"csharp_ls",
		"ruff",
	},
})

-- Tis is a callback function to set shortcuts for LSP.
function LspKeyBind(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	require("keymaps").lspKeyBinding(buf_set_keymap)
end

-- 取得 handler 可以在自動補齊函數時還會額外提供更多資訊
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- 設定 lua lsp
nvim_lsp.lua_ls.setup({
	capabilities = capabilities,

	-- 綁定快捷鍵的設定
	on_attach = LspKeyBind,

	-- 給予初始化設定
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "luarc.jsonc") then
			client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
				Lua = {
					runtime = {
						version = "LuaJIT",
					},
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
						},
					},
				},
			})

			client.notify("workspace/didChangeConfiguration", {settings = client.config.settings})
		end

		return true
	end,
})

-- 設定clangd
nvim_lsp.clangd.setup({
	on_attach = LspKeyBind,
	capabilities = capabilities,
})

-- 設定 lsp 可以支援 cmake
nvim_lsp.cmake.setup({
	on_attach = LspKeyBind,
	capabilities = capabilities,
})

-- 設定 lsp 可以支援 json
nvim_lsp.jsonls.setup({
	on_attach = LspKeyBind,
	capabilities = capabilities,
})

-- 設定 lsp 可以支援 bash
nvim_lsp.bashls.setup({
	on_attach = LspKeyBind,
	capabilities = capabilities,
})

local function get_clangd_path()
	local utils = require("utils.init")
	if "Windows" == utils.get_platform() then
		return "C:/msys2/ucrt64/clangd.exe"
	else
		return "clangd"
	end
end

-- 設定 lsp 可以支援 yaml
nvim_lsp.yamlls.setup({
	on_attach = LspKeyBind,
	capabilities = capabilities,
})

-- 設定 lsp 使用 pyright 支援 python
nvim_lsp.pyright.setup({
	on_attach = LspKeyBind,
	capabilities = capabilities,
	settings = {
		pyright = {
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				ignore = {"*"},
			},
		},
	},
})

-- 設定 lsp 支援 powershell
nvim_lsp.powershell_es.setup({
	on_attach = LspKeyBind,
	capabilities = capabilities,
})

-- 設定 lsp 支援 godot
nvim_lsp.gdscript.setup({
	on_attach = LspKeyBind,
	capabilities = capabilities,
})

-- 設定 lsp 支援 c#
nvim_lsp.csharp_ls.setup({
	on_attach = LspKeyBind,
	capabilities = capabilities,
})
