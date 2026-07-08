local status, codecompanion = pcall(require, "codecompanion")
if not status then
	vim.notify("Not found the plugin: codecompanion")
	return
end

codecompanion.setup({
	strategies = {
		chat = {
			adapter = "ollama",
		},
		inline = {
			adapter = "ollama",
		},
		agent = {
			adapter = "ollama",
		},
	},

	adapters = {
		ollama = function()
			return require("codecompanion.adapters").extend("ollama", {
				name = "ollama",
				url = "http://localhost:11434",
				env = {
					api_key = "",
				},
				schema = {
					model = {
						default = "gemma3:4b",
						choices = {
							"gemma3:4b",
							"gemma4:e2b",
						},
					},
				},
				opts = {
					system_prompt = "你是程式設計師助理。請一律使用繁體中文（台灣習慣用語）回答所有問題和說明程式碼。",
				},
			})
		end,
	},

	opts = {
		log_level = "DEBUG",
		language = "Chinese",
	},
})
