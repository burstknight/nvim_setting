local status, fidget = pcall(require, "fidget")
if not status then
	vim.notify("Not found the plugin: fidget")
	return
end

local progress_handler = nil

vim.api.nvim_create_autocmd({ "User" }, {
	pattern = "CodeCompanionRequest*",
	group = vim.api.nvim_create_augroup("CodeCompanionHooks", {}),
	callback = function(request)
		if "CodeCompanionRequestStarted" == request.match then
			if progress_handler then
				progress_handler.message = "Abort."
				progress_handler:cancel()
				progress_handler = nil
			end

			progress_handler = fidget.progress.handle.create({
				title = "AI",
				message = "Thinking...",
				lsp_client = { name = "CodeCompanion" },
			})
		elseif "CodeCompanionRequestFinished" == request.match then
			if progress_handler then
				progress_handler.message = "Done!"
				progress_handler:finish()
				progress_handler = nil
			end
		end
	end,
})
