local status, dotnet = pcall(require, "dotnet")
if not status then
	vim.notify("Not found the plugin: dotnet.nvim")
end

dotnet.setup({
})
