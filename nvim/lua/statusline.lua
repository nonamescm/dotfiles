local vim = vim

local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = { "NvimTree", "packer" } -- keeping this table { } as empty will show inactive statuslines

local function checkwidth()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 40 then
		return true
	end
	return false
end

-- Colors {{{
local colors = require("colors")
-- }}}

-- Left galaxyline {{{
gls.left[1] = {
	leftRounded = {
		provider = function()
			return "  "
		end,
		highlight = {colors.bg, colors.bg}
	}
}

gls.left[2] = {
	FileIcon = {
		provider = "FileIcon",
		highlight = {colors.fg, colors.bg},
	}
}

gls.left[3] = {
	RoundedSymbol = {
		provider = function()
			return ""
		end,
		separator = " ",
		highlight = { colors.bg, colors.lightbg },
		separator_highlight = { colors.red, colors.lightbg }
	}
}

gls.left[4] = {
	GetLspProvider = {
		condition = function()
			return checkwidth
		end,
		provider = function() return "LSP" end,
		icon = " ",
		highlight = { colors.fg, colors.lightbg }
	}
}

gls.left[5] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "   ",
		highlight = {colors.red, colors.lightbg}
	}
}

gls.left[6] = {
	Space = {
		provider = function()
			return " "
		end,
		highlight = {colors.lightbg, colors.lightbg}
	}
}

gls.left[7] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = {colors.yellow, colors.lightbg},
		separator = " ",
		separator_highlight = { colors.bg, colors.lightbg },
	}
}

gls.left[8] = {
	rightNearEnd = {
		provider = function()
			return ""
		end,
		highlight = { colors.bg, colors.lightbg },
	}
}

gls.left[9] = {
	RightEnd = {
		provider = function()
			return ""
		end,
		highlight = { colors.bg, colors.bg },
	}
}

gls.left[10] = {
	CurrentTime = {
		condition = checkwidth,
		provider = function()
			return vim.fn.strftime('%T') .. " "
		end,
		highlight = {colors.yellow, colors.bg},
	}
}

gls.left[11] = {
	MidSeparator = {
		provider = function()
			return " "
		end,
		highlight = {colors.bg, colors.lightbg},
	}
}

gls.left[12] = {
	FileName = {
		condition = checkwidth,
		provider = function()
			return vim.fn.expand("%:t")
		end,
		separator = "  ",
		highlight = {colors.white, colors.lightbg},
		separator_highlight = { colors.white, colors.lightbg }
	}
}

gls.left[13] = {
	OtherSeparator = {
		provider = function()
			return ""
		end,
		highlight = {colors.lightbg, colors.bg}
	}
}
-- }}}

-- Right galaxyline {{{
gls.right[1] = {
	FolderSeparator = {
		provider = function()
			return " "
		end,
		highlight = {colors.bg, colors.lightbg},
	}
}

gls.right[2] = {
	FolderName = {
		condition = checkwidth,
		provider = function()
			return vim.fn.expand('%:p:h:t') .. " "
		end,
		separator = " ",
		highlight = { colors.white, colors.lightbg },
		separator_highlight = { colors.white, colors.lightbg }
	}
}

gls.right[3] = {
	FolderSeparator_2 = {
		provider = function()
			return ""
		end,
		highlight = {colors.lightbg, colors.bg}
	}
}

gls.right[4] = {
	GitIcon = {
		provider = function()
			return " "
		end,
		condition = require("galaxyline.condition").check_git_workspace,
		highlight = {colors.green, colors.bg},
		separator = " ",
		separator_highlight = { colors.bg, colors.bg }
	}
}

gls.right[5] = {
	GitBranch = {
		provider = "GitBranch",
		condition = require("galaxyline.provider_vcs").check_git_workspace,
		highlight = {colors.green, colors.bg}
	}
}

gls.right[6] = {
	right_LeftRounded = {
		provider = function()
			return ""
		end,
		separator = " ",
		separator_highlight = {colors.bg, colors.bg},
		highlight = {colors.lightbg, colors.bg}
	}
}

gls.right[7] = {
	IconMode = {
		provider = function()
			return "  "
		end,
		highlight = { colors.fg, colors.lightbg }
	}
}

gls.right[8] = {
	ViMode = {
		provider = function()
			local mode = vim.fn.mode()

			local alias = {
				n = "NORMAL",
				i = "INSERT",
				c = "COMMAND",
				V = "VISUAL/LINE",
				[""] = "VISUAL/BLOCK",
				v = "VISUAL",
				R = "REPLACE",
				t = "TERM",
			}

			return " " ..alias[mode] .. " "
		end,
		highlight = {colors.fg, colors.lightbg},

		separator = "",
		separator_highlight = { colors.bg, colors.bg }
	}
}

gls.right[9] = {
	Icon = {
		provider = function()
			return " "
		end,
		highlight = {colors.lightbg, colors.bg},
	}
}
-- }}}
