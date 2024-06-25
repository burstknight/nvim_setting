local mason_nvim_dap = require("mason-nvim-dap")

mason_nvim_dap.setup({
	ensure_installed = {
		"python"
	},
	automatic_installation = true,
})
