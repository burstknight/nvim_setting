local status, codecompanion = pcall(require, "codecompanion")
if not status then
	vim.notify("Not found the plugin: codecompanion")
	return
end

local system_prompt =
	"你是資深的程式設計師。你必須使用繁體中文（台灣慣用語）回答所有問題和說明程式碼。"

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
					system_prompt = system_prompt,
				},
			})
		end,

		gemini = function()
			return require("codecompanion.adapters").extend("gemini", {
				env = {
					api_key = os.getenv("GEMINI_API_KEY"),
				},
				schema = {
					model = {
						default = "gemini-3.5-flash",
					},
				},
				opts = {
					system_prompt = system_prompt,
				},
			})
		end,
	},

	opts = {
		log_level = "DEBUG",
		language = "Chinese",
	},

	prompt_library = {
		["Explain code (zh_TW)"] = {
			strategy = "chat",
			description = "用中文分析程式碼",
			opts = {
				index = 1,
				is_default = true,
				is_slash_cmd = true,
				modes = { "v" }, -- Just run this prompt for visual mode.
				short_name = "Explain",
				auto_submit = true, -- Automatically send the request to LLM.
				user_prompt = false, -- User don't need input other texts.
				stop_context_insertion = true,
			},
			prompts = {
				{
					role = "system",
					content = [[你是一個有超過十年經驗的資深程式設計師，當你被要求分析選取的程式碼時，必須執行以下步驟：
1. 判斷出選取的程式碼的目的是什麼。
2. 如果選取的程式碼是函數，說明該函數有哪些參數與回傳值，以及那些參數和回傳值是什麼型態。
3. 必須把所有的說明以繁體中文(台灣慣用語)回覆給我。]],
				},
				{
					role = "user",
					content = function(context)
						local input = table.concat(context.lines, "\n")

						return string.format(
							[[分析段程式碼 `%s` 的用途：
```%s
%s
```
]],
							context.filetype,
							context.filetype,
							input
						)
					end,
					opts = {
						contains_code = true,
					},
				},
			},
		},

		-- This prompt is defined for code review.
		["Code review"] = {
			strategy = "chat",
			description = "審查選取的程式碼",
			opts = {
				index = 2,
				is_default = true,
				is_slash_cmd = true,
				modes = { "v" }, -- Just run this prompt for visual mode.
				short_name = "Code review",
				auto_submit = true, -- Automatically send the request to LLM.
				user_prompt = false, -- User don't need input other texts.
				stop_context_insertion = true,
			},
			prompts = {
				{
					role = "system",
					content = [[你是一個有超過十年經驗的資深程式設計師，當你被要求分析選取的程式碼時，必須執行以下步驟：
1. 你需要從選取的程式碼中找出潛在的Bug,、記憶體管理的問題、資安漏洞與效能瓶頸。
2. 如果你從程式碼中找到任何問題，提出改善的方法。
3. 必須把所有的說明以繁體中文(台灣慣用語)回覆給我。]],
				},
				{
					role = "user",
					content = function(context)
						local input = table.concat(context.lines, "\n")

						return string.format(
							[[審查這段程式碼，並且給出修改建議：
```%s
%s
```
]],
							context.filetype,
							input
						)
					end,
					opts = {
						contains_code = true,
					},
				},
			},
		},
	},

	display = {
		chat = {
			window = {
				layout = "vertical",
				position = "right",
				width = 0.4,
			},
		},
	},
})
