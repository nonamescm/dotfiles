local vim = vim

vim.o.fillchars = table.concat(
	{
		[[fold: ]]
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
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_buftype_exclude = { "terminal", "NvimTree", "help" }
vim.g.indentLine_fileTypeExclude = { "dashboard" }
vim.g.indent_blankline_space_char_blankline = " "
vim.g.indent_blankline_strict_tabs = true
vim.g.indent_blankline_debug = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_show_foldtext = false

require[[indent_blankline]].setup()
