local hi = require("functions.highlight")
local colors = require("colors")
local dashboard = require("dashboard")

hi("DashboardHeader", { guifg = colors.red })
hi("DashboardFooter", { guifg = colors.light_grey })
hi("DashboardCenter", { guifg = colors.blue })
hi("DashboardShortCut", { guifg = colors.blue })

dashboard.custom_header = {
	"⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀ ",
	"⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀",
	"⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀",
	"⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀",
	"⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀",
	"⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆",
	"⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛",
	-- extra spacing
	"", ""
}

dashboard.custom_footer = {
	-- extra spacing
	"", "",

	"Fuck you ~ Linus Torvalds, probably.",
}

dashboard.custom_center = {
	{ icon = " ", desc = "New File         ", action = "DashboardNewFile" },
	{ icon = " ", desc = "Open File Manager", action = "NvimTreeOpen" },
	{ icon = " ", desc = "Close Neovim     ", action = "qa" },
}

dashboard.hide_statusline = false
dashboard.hide_tabline = false
