local hi = require("functions.highlight")
local colors = require("colors")
local dashboard = require("dashboard")

hi("DashboardHeader", { guifg = colors.red })
hi("DashboardFooter", { guifg = colors.purple })
hi("DashboardCenter", { guifg = colors.blue })

local function highlight_center(table)
	for i, item in pairs(table) do
		item.icon_hl = "DashboardCenter"
		item.desc_hl = "DashboardCenter"
		table[i] = item
	end

	return table
end

dashboard.setup({
	theme = "doom",
	hide = {
		statusline = false,
		tabline = false,
		winbar = false,
	},
	config = {
		header = {
			"               ",
			"               ",
			"               ",
			"               ",
			"⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀ ",
			"⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀",
			"⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀",
			"⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀",
			"⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀",
			"⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆",
			"⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛",
			"               ",
			"               ",
		},
		center = highlight_center({
			{ icon = " ", desc = "New File         ", action = "enew" },
			{ icon = " ", desc = "Open File Manager", action = "NvimTreeOpen" },
			{ icon = " ", desc = "Close Neovim     ", action = "qa" },
		}),
		footer = {
			"                                    ",
			"                                    ",
			"Fuck you ~ Linus Torvalds, probably.",
		}
	}
})
