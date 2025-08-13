local status, leetcode = pcall(require, "leetcode")
if not status then
	vim.notify("Not found the plugin: leetcode.nvim")
	return
end

leetcode.setup({
	arg = "leetcode",
	lang = "c",
	storage = {
		home = vim.fn.stdpath("data") .. "/leetcode",
		cache = vim.fn.stdpath("cache") .. "/leetcode",
	},
	plugins = {
		non_standalone = true,
	},
	logging = true,
	cache = {
		update_interval = 60*60*24*60,
	},
	console = {
		open_on_runcode = true,
		dir = "row",
		size = {
			width = "90%",
			height = "75%",
		},
		result = {
			size = "60%",
		},
		testcase = {
			virt_text = true,
			size = "40%",
		},
	},

	description = {
		position = "left",
		width = "40%",
		show_stats = true,
	},

	hooks = {
		["enter"] = {},
		["question_enter"] = {},
		["leave"] = {},
	},

	injector = {
		["cpp"] = {
			before = {
				"#include <bits/stdc++.h>",
				"using namespace std;",
			},
			after = "int main() {}",
		},
		["c"] = {
			before = {
				"#include <stdio.h>",
				"#include <stdlib.h>",
				"#include <stdbool.h>",
				"#include <stddef.h>",
			},
			after = "int main() {}",
		},
	},

	keys = {
		toggle = {"q"},
		confirm = {"<CR>"},
		reset_testcases = "r",
		use_testcase = "U",
		focus_testcase = "H",
		focus_result = "L",
	},
	theme = {},
	image_support = false,
})
