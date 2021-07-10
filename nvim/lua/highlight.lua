local highlight = require[[functions.highlight]]

highlight("VertSplit", {
	ctermbg = "NONE",
	guibg = "NONE"
}, true)

highlight("StatusLineNC", {
	gui = "underline",
	guibg = "NONE",
	guifg = "#282C34"
}, true)
