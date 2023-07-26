local vim = vim

local galaxy = require("galaxyline")
local condition = require("galaxyline.condition")
local vcs = require("galaxyline.provider_vcs")
local fileinfo = require("galaxyline.provider_fileinfo")
local colors = require("colors")

galaxy.short_line_list = { "packer" } -- keeping this table { } as empty will show inactive statuslines

galaxy.section.left = {
	{
		StartLeft = {
			provider = function()
				return "   "
			end,
			highlight = { colors.black, colors.green },

			separator = "",
			separator_highlight = { colors.green, colors.black },
		}
	},
	{
		StatusLeft = {
			condition = function()
				return condition.check_git_workspace() and vcs.get_git_branch() ~= nil
			end,
			provider = function()
				return "  " .. vcs.get_git_branch()
			end,
			highlight = { colors.green, colors.black },

			separator = "@",
			separator_highlight = { colors.black, colors.black },
		}
	},
	{
		GitDiffAdd = {
			condition = condition.check_git_workspace,
			provider = "DiffAdd",
			icon = "  ",
			highlight = { colors.purple, colors.black },

			separator = "@",
			separator_highlight = { colors.black, colors.black },
		}
	},
	{
		GitDiffModified = {
			condition = condition.check_git_workspace,
			provider = "DiffModified",
			icon = "  ",
			highlight = { colors.blue, colors.black },

			separator = "@",
			separator_highlight = { colors.black, colors.black },
		}
	},
	{
		GitDiffRemove = {
			condition = condition.check_git_workspace,
			provider = "DiffRemove",
			icon = "  ",
			highlight = { colors.red, colors.black },

			separator = "@",
			separator_highlight = { colors.black, colors.black },
		}
	},
	{
		LeftSectionStart = {
			provider = function()
				return ""
			end,
			highlight = { colors.black, colors.black2 },

			separator = "@@",
			separator_highlight = { colors.black2, colors.black2 },
		}
	},
	{
		FileIcon = {
			provider = function()
				return fileinfo.get_file_icon()
			end,

			highlight = { fileinfo.get_file_icon_color(), colors.black2 }
		}
	},
	{
		FileName = {
			provider = function()
				local name = fileinfo.get_current_file_name()

				if name == "" then
					return "Empty buffer"
				else
					return name
				end
			end,
			highlight = { colors.fg, colors.black2 },

			separator = "@@",
			separator_highlight = { colors.black2, colors.black2 },
		}
	},
	{
		LeftSectionEnd = {
			provider = function()
				return ""
			end,
			highlight = { colors.black2, colors.black },

			separator = "@@",
			separator_highlight = { colors.black, colors.black },
		}
	}
}

galaxy.section.right = {
	{
		LspErrorInfo = {
			provider = "DiagnosticError",
			highlight = { colors.red, colors.black },
			icon = " ",

			separator = "@",
			separator_highlight = { colors.black, colors.black },
		}
	},
	{
		LspWarnInfo = {
			provider = "DiagnosticWarn",
			highlight = { colors.yellow, colors.black },
			icon = " ",

			separator = "@",
			separator_highlight = { colors.black, colors.black },
		}
	},
	{
		LspHintInfo = {
			provider = "DiagnosticHint",
			highlight = { colors.green, colors.black },
			icon = " ",

			separator = "@",
			separator_highlight = { colors.black, colors.black },
		}
	},
	{
		LspInfoInfo = {
			provider = "DiagnosticInfo",
			highlight = { colors.blue, colors.black },
			icon = " ",

			separator = "@",
			separator_highlight = { colors.black, colors.black },
		}
	},
	{
		RightSectionStart = {
			provider = function()
				return ""
			end,
			highlight = { colors.black, colors.black2 },
		}
	},
	{
		FolderIcon = {
			provider = function()
				return " "
			end,
			highlight = { colors.blue, colors.black2 },

			separator = "@@",
			separator_highlight = { colors.black2, colors.black2 },
		}
	},
	{
		FolderName = {
			provider = function()
				local folder = vim.fn.expand("%:p:h")
				local cwd = vim.fn.getcwd()
				if folder:sub(1, cwd:len()) == cwd then
					return folder:gsub(cwd .. "", ".")
				else
					return folder
				end
			end,
			highlight = { colors.fg, colors.black2 },

			separator = "@",
			separator_highlight = { colors.black2, colors.black2 },
		}
	},
	{
		LspLoadStatus = {
			provider = function()
				local status = vim.lsp.util.get_progress_messages()[1]
				if status and (status.percentage ~= nil or status.progress) then
					local percentage = status.percentage or 100
					local title = status.title or ""
					return title .. "(" .. tostring(percentage) .. "%)"
				end
			end,
			highlight = { colors.lightbg, colors.black2 },

			separator = "@",
			separator_highlight = { colors.black2, colors.black2 },
		}
	},
	{
		RightSectionEnd = {
			provider = function()
				return ""
			end,
			highlight = { colors.black2, colors.black },

			separator = "@",
			separator_highlight = { colors.black2, colors.black2 },
		}
	},
	{
		EndRight = {
			provider = function()
				return "@"
			end,
			highlight = { colors.black, colors.black }
		}
	}
}
