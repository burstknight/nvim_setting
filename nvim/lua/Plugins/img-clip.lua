local status, img_clip = pcall(require, "img-clip")
if not status then
	vim.notify("Not found the plugin: img-clip")
	return
end

img_clip.setup({
	filetypes = {
		codecompanion = {
			prompt_for_file_name = false,
			template = "[Image]($FILE_PATH)",
			use_absolute_path = true,
		},
	},
})
