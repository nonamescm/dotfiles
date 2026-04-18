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
		bg = "#394351"
	},
	Comment = {
		fg = "#7188A8",
		italic = true
	},
	Conceal = {
		fg = "#1AC77F"
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
		bg = "#394351"
	},
	DiagnosticSignError = {
		fg = colors.red
	},
	DiagnosticSignHint = {
		fg = "#4C596B"
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
		fg = "#1AC77F"
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
		fg = "#4C596B"
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
		fg = "#7188A8",
		bg = "#394351"
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
		fg = "#1AC77F"
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
		fg = colors.fg
	},
	Ignore = {},
	IncSearch = {
		fg = colors.red,
		bg = "#394351"
	},
	InfoMsg = {
		fg = "#7188A8"
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
		fg = "#4C596B"
	},
	LspReferenceRead = {
		bg = "#394351"
	},
	LspReferenceText = {
		bg = "#394351"
	},
	LspSignatureActiveParameter = {
		link = "LspReferenceText"
	},
	LspReferenceWrite = {
		bg = "#394351"
	},
	MatchParen = {
		fg = colors.red,
		bg = "#394351"
	},
	ModeMsg = {
		fg = "#4C596B"
	},
	MoreMsg = {
		fg = colors.green
	},
	MsgArea = {
		fg = "#7188A8"
	},
	MsgSeparator = {
		fg = "#4C596B"
	},
	Noise = {
		fg = "#4C596B"
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
		fg = "#394351"
	},
	Whitespace = {
		link = "NonText"
	},
	NormalFloat = {
		fg = colors.fg,
		bg = "#0B0C0F"
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
		bg = "#394351"
	},
	PmenuThumb = {
		bg = "#394351"
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
		fg = "#7188A8"
	},
	Special = {
		fg = colors.red
	},
	SpecialComment = {
		fg = colors.cyan
	},
	SpecialKey = {
		fg = colors.green,
		bg = "#394351"
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
		fg = "#7188A8"
	},
	StatusLineNC = {
		fg = "#4C596B"
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
		fg = "#7188A8"
	},
	TSTagAttribute = {
		fg = "#7188A8"
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
		fg = "#7188A8"
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
		bg = "#394351"
	},
	VisualNOS = {
		bg = "#262D36"
	},
	WarnMsg = {
		fg = "#7188A8",
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
		bg = "#394351"
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
		fg = "#7188A8",
		italic = true
	},
	markdownH5 = {
		fg = "#7188A8",
		italic = true
	},
	markdownH6 = {
		fg = "#7188A8",
		italic = true
	},
}

vim.cmd("highlight clear")
vim.cmd("set t_Co=256")
vim.cmd("let g:colors_name='bloop'")

for group, attributes in pairs(theme) do
	vim.api.nvim_set_hl(0, group, attributes)
end
