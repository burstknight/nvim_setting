vim.diagnostic.config({
	vitual_text = true,
	signs = true,

	-- 在插入模式下也會更新 icon，但有可能會影響效能
	update_in_insert = true,
})

local signs = {
	Error = "",
	Info = "",
	Hint = "",
	Warn = "",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end
