local ts_config = require("nvim-treesitter.configs")
local colors = require("colors")

ts_config.setup {
	ensure_installed = {
		"javascript",
		"html",
		"css",
		"bash",
		"lua",
		"json",
		"python"
	},
	highlight = {
		enable = true,
		use_languagetree = true
	},
	rainbow = {
		enable = false,
		colors = {
			colors.red,
			colors.orange,
			colors.yellow,
			colors.green,
			colors.cyan,
			colors.blue,
			colors.purple,
		},
	}
}

vim.api.nvim_set_hl(0, "@symbol", { link = "Type" })
