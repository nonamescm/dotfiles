local highlight = require("functions.highlight")
local colors = require("colors")

highlight("VertSplit", {
	guibg = colors.lightbg,
	guifg = colors.lightbg
}, true)

highlight("StatusLineNC", {
	gui = "underline",
	guibg = "NONE",
	guifg = colors.lightbg
}, true)
