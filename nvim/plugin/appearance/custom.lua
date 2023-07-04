local highlight = require("functions.highlight")
local colors = require("colors")

highlight("@field", { guifg = colors.red })

highlight("EndOfBuffer", { guibg = "NONE" })
highlight("Normal", { guibg = "NONE" })
highlight("NormalFloat", { guibg = "NONE" })

highlight("NvimTreeFolderIcon", { guifg = colors.blue })
highlight("NvimTreeEndOfBuffer", { guibg = "NONE" })
highlight("NvimTreeNormal", { guibg = "NONE" })

local lspkinds = {
	Error = colors.red,
	Warn = colors.yellow,
	Info = colors.blue,
	Hint = colors.green,
}

for kind, color in pairs(lspkinds) do
	local group = "DiagnosticSign" .. kind
	highlight(group, { guifg = color })
end
