local hi = require("functions.highlight")
local colors = require("colors")

hi("DashboardHeader", { guifg = colors.light_grey })
hi("DashboardFooter", { guifg = colors.light_grey })
hi("DashboardCenter", { guifg = colors.light_grey })
hi("DashboardShortCut", { guifg = colors.light_grey })

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

vim.g.dashboard_default_executive = "telescope"


vim.g.dashboard_custom_section = {
	a = { description = { "  Find File                 SPC f f" }, command = "Telescope find_files" },
	b = { description = { "  Recents                   SPC f o" }, command = "Telescope oldfiles" },
	d = { description = { "洛 New File                  SPC f n" }, command = "DashboardNewFile" },
}

vim.g.dashboard_custom_footer = {
	"Neovim",
}

