local vim = vim

local gl = require("galaxyline")
local gls = gl.section
local glc = require("galaxyline.condition")
local vcs = require("galaxyline.provider_vcs")
local glf = require("galaxyline.provider_fileinfo")
local lsp = require("galaxyline.provider_lsp")

gl.short_line_list = { "NvimTree", "packer" } -- keeping this table { } as empty will show inactive statuslines

local colors = require("colors")

-- galaxyline {{{
gls.left[1] = {
	StartLeft = {
		provider = function()
			return "   "
		end,
		highlight = { colors.bg, colors.green },

		separator = "",
		separator_highlight = { colors.green, colors.bg },
	}
}

gls.left[2] = {
	StatusLeft = {
		condition = function()
			return glc.check_git_workspace() and (vcs.get_git_branch() ~= nil)
		end,
		provider = function()
			return "  " .. vcs.get_git_branch()
		end,
		highlight = { colors.green, colors.bg },

		separator = "@",
		separator_highlight = { colors.bg, colors.bg },
	}
}

gls.left[3] = {
	GitDiffAdd = {
		condition = glc.check_git_workspace,
		provider = "DiffAdd",
		icon = "  ",
		highlight = { colors.purple, colors.bg },

		separator = "@",
		separator_highlight = { colors.bg, colors.bg },
	}
}

gls.left[4] = {
	GitDiffModified = {
		condition = glc.check_git_workspace,
		provider = "DiffModified",
		icon = " 柳",
		highlight = { colors.blue, colors.bg },

		separator = "@",
		separator_highlight = { colors.bg, colors.bg },
	}
}

gls.left[5] = {
	GitDiffRemove = {
		condition = glc.check_git_workspace,
		provider = 'DiffRemove',
		icon = "  ",
		highlight = { colors.red, colors.bg },

		separator = "@",
		separator_highlight = { colors.bg, colors.bg },
	}
}

gls.left[6] = {
	LeftSepOne = {
		provider = function()
			return ''
		end,
		highlight = { colors.bg, colors.black },

		separator = '@@',
		separator_highlight = { colors.black, colors.black },
	}
}

gls.left[7] = {
	FileIcon = {
		provider = function()
			local icon = glf.get_file_icon():gsub("^%s*(.-)%s*$", "%1")
			if icon == '' then
				return ''
			else
				return icon .. ' '
			end
		end,
		highlight = { colors.fg, colors.black }
	}
}

gls.left[8] = {
	FileName = {
		provider = function()
			local name = glf.get_current_file_name():gsub("^%s*(.-)%s*$", "%1")

			if name == "" then
				return "Empty buffer"
			else
				return name
			end
		end,
		highlight = { colors.fg, colors.black },

		separator = "@@",
		separator_highlight = { colors.black, colors.black },
	}
}

gls.left[9] = {
	LeftSepTwo = {
		provider = function()
			return ''
		end,
		highlight = { colors.black, colors.bg },

		separator = '@@',
		separator_highlight = { colors.bg, colors.bg },
	}
}
-- }}}

-- Right {{{
gls.right[0] = {
	LspErrorInfo = {
		provider = 'DiagnosticError',
		highlight = { colors.red, colors.bg },
		icon = ' ',

		separator = '@',
		separator_highlight = { colors.bg, colors.bg },
	}
}

gls.right[1] = {
	LspWarnInfo = {
		provider = 'DiagnosticWarn',
		highlight = { colors.yellow, colors.bg },
		icon = ' ',

		separator = '@',
		separator_highlight = { colors.bg, colors.bg },
	}
}

gls.right[2] = {
	LspHintInfo = {
		provider = 'DiagnosticHint',
		highlight = { colors.green, colors.bg },
		icon = ' ',

		separator = '@',
		separator_highlight = { colors.bg, colors.bg },
	}
}

gls.right[3] = {
	LspInfoInfo = {
		provider = 'DiagnosticInfo',
		highlight = { colors.blue, colors.bg },
		icon = ' ',

		separator = '@',
		separator_highlight = { colors.bg, colors.bg },
	}
}

gls.right[4] = {
	RightSepOne = {
		provider = function()
			return ''
		end,
		highlight = { colors.black, colors.bg },
	}
}

gls.right[5] = {
	LspProviderInfo = {
		provider = function()
			return ' ' .. lsp.get_lsp_client()
		end,
		highlight = { colors.blue, colors.black },

		separator = '@',
		separator_highlight = { colors.black, colors.black },
	}
}

gls.right[6] = {
	LspLoadStatus = {
		provider = function()
			local status = vim.lsp.util.get_progress_messages()[1]
			if status and (status.percentage ~= nil or status.progress) then
				local percentage = status.percentage or 100
				local title = status.title or ''
				return  title .. '(' .. tostring(percentage) .. '%)'
			end
		end,
		highlight = { colors.lightbg, colors.black },

		separator = '@',
		separator_highlight = { colors.black, colors.black },
	}
}

gls.right[7] = {
	RightSepTwo = {
		provider = function()
			return ''
		end,
		highlight = { colors.black, colors.bg },

		separator = '@',
		separator_highlight = { colors.black, colors.black },
	}
}

gls.right[8] = {
	EndRight = {
		provider = function()
			return '@'
		end,
		highlight = { colors.bg, colors.bg }
	}
}
-- }}}
