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


-- Tis is a callback function to set shortcuts for LSP.
function LspKeyBind(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	require("keymaps").lspKeyBinding(buf_set_keymap)
end

mason.setup()
mason_lspconfig.setup({
	automatic_installation = true,
	ensure_installed = {
		"lua_ls",
	},
})

-- 設定 lua lsp
nvim_lsp.lua_ls.setup({
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

