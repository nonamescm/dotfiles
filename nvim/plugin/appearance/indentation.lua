local vim = vim

vim.o.fillchars = table.concat(
	{
		"fold: ",
		"eob: ",
	},
	","
)
vim.o.foldmethod = "indent"
vim.wo.listchars = table.concat(
	{
		"tab:│ ",
		"extends:❯",
		"precedes:❮",
		"nbsp:_",
	},
	","
)
-- indent-blankline

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	local colors = require("colors")

	vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.red })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.orange })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.green })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.purple })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.cyan })
end)

require("ibl").setup {
	exclude = {
		filetypes = { "dashboard" },
		buftypes = { "terminal", "help", "terminal", "nofile", "quickfix", "prompt", "dashboard" },
	},
	indent = {
		highlight = highlight
	},
}


