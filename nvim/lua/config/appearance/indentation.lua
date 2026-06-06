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

local hooks = require("ibl.hooks")

-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	local colors = require("colors")
	vim.api.nvim_set_hl(0, "IblIndent", { link = "Noise" })
end)

require("ibl").setup {
	exclude = {
		filetypes = { "dashboard" },
		buftypes = { "terminal", "help", "terminal", "nofile", "quickfix", "prompt", "dashboard" },
	},
}
