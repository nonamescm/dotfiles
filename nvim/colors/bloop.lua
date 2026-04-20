local colors = require("colors")

local theme = {
	Normal = {
		fg = colors.fg,
		bg = colors.bg
	},
	Bold = {
		bold = true
	},
	ColorColumn = {
		bg = colors.lightbg
	},
	Comment = {
		fg = colors.dark_purple,
		italic = true
	},
	Conceal = {
		fg = colors.dark_green
	},
	Constant = {
		fg = colors.green
	},
	Boolean = {
		link = "Constant"
	},
	Character = {
		link = "Constant"
	},
	Float = {
		link = "Constant"
	},
	Number = {
		link = "Constant"
	},
	String = {
		link = "Constant"
	},
	Cursor = {
		fg = colors.bg,
		bg = "#39051A"
	},
	CursorColumn = {
		bg = "#262D36"
	},
	CursorIM = {},
	CursorLine = {
		bg = "#262D36"
	},
	CursorLineNr = {
		fg = colors.red
	},
	Debug = {
		fg = colors.orange,
		bg = colors.lightbg
	},
	DiagnosticSignError = {
		fg = colors.red
	},
	DiagnosticSignHint = {
		fg = colors.purple_alt
	},
	DiagnosticSignInfo = {
		fg = colors.purple
	},
	DiagnosticSignWarn = {
		fg = colors.cyan
	},
	DiagnosticUnderlineError = {},
	DiagnosticUnderlineHint = {},
	DiagnosticUnderlineInfo = {},
	DiagnosticUnderlineWarn = {},
	DiffAdd = {
		fg = colors.green
	},
	DiffChange = {
		fg = colors.dark_green
	},
	DiffDelete = {
		fg = colors.red
	},
	DiffText = {
		bg = "#262D36"
	},
	Directory = {
		fg = colors.green
	},
	EndOfBuffer = {
		fg = colors.purple_alt
	},
	TSDanger = {
		link = "Error"
	},
	ErrorMsg = {
		fg = colors.red,
		bg = "#39051A"
	},
	DiagnosticError = {
		link = "ErrorMsg"
	},
	Error = {
		link = "ErrorMsg"
	},
	NvimInternalError = {
		link = "ErrorMsg"
	},
	FloatBorder = {
		fg = "#262D36",
		bg = "#0B0C0F"
	},
	LspFloatWinBorder = {
		link = "FloatBorder"
	},
	TelescopeBorder = {
		link = "FloatBorder"
	},
	FloatNormal = {
		fg = colors.fg,
		bg = "#0B0C0F"
	},
	LspFloatWinNormal = {
		link = "FloatNormal"
	},
	NvimTreeNormal = {
		link = "FloatNormal"
	},
	TelescopeNormal = {
		link = "FloatNormal"
	},
	WhichKeyFloat = {
		link = "FloatNormal"
	},
	Folded = {
		fg = colors.dark_purple,
		bg = colors.lightbg
	},
	FoldColumn = {
		link = "Folded"
	},
	Function = {
		fg = colors.cyan
	},
	GitSignsAdd = {
		fg = colors.green
	},
	GitGutterAdd = {
		link = "GitSignsAdd"
	},
	GitSignsChange = {
		fg = colors.dark_green
	},
	GitGutterChange = {
		link = "GitSignsChange"
	},
	GitSignsDelete = {
		fg = colors.red
	},
	GitGutterDelete = {
		link = "GitSignsDelete"
	},
	HintMsg = {
		fg = colors.green,
		italic = true
	},
	DiagnosticHint = {
		link = "HintMsg"
	},
	Identifier = {
		fg = colors.red
	},
	Ignore = {},
	IncSearch = {
		fg = colors.red,
		bg = colors.lightbg
	},
	InfoMsg = {
		fg = colors.dark_purple
	},
	DiagnosticInfo = {
		link = "InfoMsg"
	},
	Italic = {
		italic = true
	},
	Keyword = {
		fg = colors.red
	},
	Include = {
		link = "Keyword"
	},
	PreProc = {
		link = "Keyword"
	},
	Statement = {
		link = "Keyword"
	},
	TSKeyword = {
		link = "Keyword"
	},
	TSKeywordFunction = {
		link = "Keyword"
	},
	LineNr = {
		fg = colors.purple_alt
	},
	LspReferenceRead = {
		bg = colors.lightbg
	},
	LspReferenceText = {
		bg = colors.lightbg
	},
	LspSignatureActiveParameter = {
		link = "LspReferenceText"
	},
	LspReferenceWrite = {
		bg = colors.lightbg
	},
	MatchParen = {
		fg = colors.red,
		bg = colors.lightbg
	},
	ModeMsg = {
		fg = colors.purple_alt
	},
	MoreMsg = {
		fg = colors.green
	},
	MsgArea = {
		fg = colors.dark_purple
	},
	MsgSeparator = {
		fg = colors.purple_alt
	},
	Noise = {
		fg = colors.purple_alt
	},
	Assign = {
		link = "Noise"
	},
	Braces = {
		link = "Noise"
	},
	Comma = {
		link = "Noise"
	},
	Delimiter = {
		link = "Noise"
	},
	Parens = {
		link = "Noise"
	},
	TSOperator = {
		link = "Noise"
	},
	TSPunctBracket = {
		link = "Noise"
	},
	TSPunctDelimiter = {
		link = "Noise"
	},
	TSTagDelimiter = {
		link = "Noise"
	},
	luaTSConstructor = {
		link = "Noise"
	},
	NonText = {
		fg = colors.lightbg
	},
	Whitespace = {
		link = "NonText"
	},
	NormalFloat = {
		link = "Normal",
	},
	Pmenu = {
		fg = colors.fg
	},
	PmenuSbar = {
		fg = colors.green,
		bg = colors.bg
	},
	PmenuSel = {
		fg = colors.fg,
		bg = colors.lightbg
	},
	PmenuThumb = {
		bg = colors.lightbg
	},
	Question = {
		fg = colors.orange
	},
	QuickFixLine = {
		fg = colors.green
	},
	Search = {
		bg = "#39051A"
	},
	SignColumn = {
		fg = colors.dark_purple
	},
	Special = {
		fg = colors.red
	},
	SpecialComment = {
		fg = colors.cyan
	},
	SpecialKey = {
		fg = colors.green,
		bg = colors.lightbg
	},
	Conditional = {
		link = "Statement"
	},
	Label = {
		link = "Statement"
	},
	Operator = {
		link = "Statement"
	},
	Repeat = {
		link = "Statement"
	},
	StatusLine = {
		fg = colors.dark_purple
	},
	StatusLineNC = {
		fg = colors.purple_alt
	},
	Substitute = {
		fg = colors.red,
		bg = "#39051A"
	},
	TSConstructor = {
		fg = colors.orange
	},
	TSField = {
		fg = colors.purple
	},
	TSKeywordOperator = {
		fg = colors.red,
		italic = true
	},
	TSKeywordReturn = {
		fg = colors.red,
		bold = true
	},
	TSMethod = {
		fg = colors.cyan
	},
	TSNamespace = {
		fg = colors.purple,
		italic = true
	},
	TSNote = {
		fg = colors.green,
		italic = true
	},
	TSProperty = {
		fg = colors.purple
	},
	TSTag = {
		fg = colors.dark_purple
	},
	TSTagAttribute = {
		fg = colors.dark_purple
	},
	TSVariable = {
		fg = colors.fg
	},
	TSVariableBuiltin = {
		fg = colors.green
	},
	TSWarning = {
		fg = colors.red
	},
	TabLine = {
		fg = colors.dark_purple
	},
	TabLineFill = {
		link = "TabLine"
	},
	TabLineSel = {
		fg = colors.green,
		bg = "#262D36"
	},
	Tag = {
		fg = colors.orange
	},
	TelescopeTitle = {
		fg = colors.red
	},
	TermCursor = {
		reverse = true
	},
	TermCursorNC = {
		bg = "#262D36"
	},
	TermNormal = {
		bg = "#0B0C0F"
	},
	Title = {
		fg = colors.fg
	},
	TreesitterContext = {
		bg = "#0B0C0F"
	},
	TreesitterContextLineNumber = {
		bg = "#0B0C0F"
	},
	Type = {
		fg = colors.orange
	},
	Typedef = {
		fg = colors.orange
	},
	Underlined = {
		underline = true
	},
	VertSplit = {
		fg = "#262D36"
	},
	Visual = {
		bg = colors.lightbg
	},
	VisualNOS = {
		bg = "#262D36"
	},
	WarnMsg = {
		fg = colors.dark_purple,
		bg = "#0B0C0F",
		bold = true
	},
	DiagnosticWarn = {
		link = "WarnMsg"
	},
	WarningMsg = {
		fg = colors.red
	},
	WhichKey = {
		fg = colors.green
	},
	WildMenu = {
		fg = colors.fg,
		bg = colors.lightbg
	},
	markdownH1 = {
		fg = colors.red,
		bold = true
	},
	markdownH2 = {
		fg = colors.green
	},
	markdownH3 = {
		fg = colors.green,
		italic = true
	},
	markdownH4 = {
		fg = colors.dark_purple,
		italic = true
	},
	markdownH5 = {
		fg = colors.dark_purple,
		italic = true
	},
	markdownH6 = {
		fg = colors.dark_purple,
		italic = true
	},
	["@variable.member.lua"] = {
		link = "Identifier",
	}
}

vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='bloop'")

for group, attributes in pairs(theme) do
	vim.api.nvim_set_hl(0, group, attributes)
end
