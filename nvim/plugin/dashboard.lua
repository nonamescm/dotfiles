local hi = require("functions.highlight")
local colors = require("colors")

hi("DashboardHeader", { guifg = colors.red })
hi("DashboardFooter", { guifg = colors.light_grey })
hi("DashboardCenter", { guifg = colors.blue })
hi("DashboardShortCut", { guifg = colors.blue })

vim.g.dashboard_custom_header = {
	'⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀ ',
    '⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀',
	'⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀',
	'⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀',
	'⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀',
	'⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆',
	'⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛',
}

vim.g.dashboard_custom_footer = {
	"Fuck you ~ Linus Torvalds, probably.",
}

vim.g.dashboard_custom_section = {
	a = { description = { " New File         " }, command = "DashboardNewFile" },
	b = { description = { " Open File Manager" }, command = "NvimTreeOpen" },
	c = { description = { " Close Neovim     " }, command = "q" },
}
