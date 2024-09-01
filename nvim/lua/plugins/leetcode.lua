local status, leetcode = pcall(require, "leetcode")
if not status then
	vim.notify("Not found the plugin: leetcode.nvim")
	return
end

leetcode.setup({
})
