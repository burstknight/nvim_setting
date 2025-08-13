local nvim_set_var = vim.api.nvim_set_var

local chadtree_settings = {
	keymap = {
		change_dir = {"W"},
		change_focus = {},
		change_focus_up = {"U"},
		collapse = {"c"},
		stat = {"L"},
		h_split = {"i"},
		v_split = {"I"},
		toggle_version_control = {},
		toggle_follow = {},
		toggle_follow_links = {},
	},
	theme = {
		text_colour_set = "nerdtree_syntax_dark",
	},
}

nvim_set_var("chadtree_settings", chadtree_settings)
