require("notify").setup {
	stages = "fade",
	timeout = 1000,
}

vim.notify = require("notify")

local colors = require("colors")
local hi = require("functions.highlight")

hi("NotifyERRORBody", { guifg = colors.red })
hi("NotifyERRORBorder", { guifg = colors.red })
hi("NotifyERRORIcon", { guifg = colors.red })

hi("NotifyWARNBody", { guifg = colors.yellow })
hi("NotifyWARNBorder", { guifg = colors.yellow })
hi("NotifyWARNIcon", { guifg = colors.yellow })

hi("NotifyINFOBody", { guifg = colors.blue })
hi("NotifyINFOBorder", { guifg = colors.blue })
hi("NotifyINFOIcon", { guifg = colors.blue })
