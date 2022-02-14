-- vim:fdm=marker
-- Vim Color File
-- Name:       palenight.lua
-- Maintainer: https://github.com/murilo-menezes
-- License:    GPL-3
-- Based On:   drewtempelmeyer/palenight.vim and joshdick/onedark.vim

-- Highlight Function And Color definitons {{{
local vim = vim

local function hi(group, styles)
	local cmd = vim.cmd or vim.command

	local gui = styles.gui and 'gui='..styles.gui or 'gui=NONE'
	local sp = styles.sp and 'guisp='..styles.sp or 'guisp=NONE'
	local fg = styles.fg and 'guifg='..styles.fg or 'guifg=NONE'
	local bg = styles.bg and 'guibg='..styles.bg or 'guibg=NONE'
	cmd('highlight '..group..' '..gui..' '..sp..' '..fg..' '..bg)
end

local bg_normal   = '#282838'
local bg_darker   = '#222632'
local bg_dark     = '#2b2b3b'
local bg          = '#393d4e'
local bg_light    = '#42475d'
local bg_lighter  = '#545277'
local grey        = '#97a6c0'
local red         = '#f07178'
local heavy_red   = '#ff5370'
local green       = '#7cd380'
local blue        = '#729aef'
local yellow      = '#ffcb6b'
local orange      = '#e37858'
local purple      = '#b782da'
local cyan        = '#529dbc'
local fg          = '#bbc2cf'
local fg_light    = '#b6bcdd'
local fg_dark     = '#6d749c'
local vis         = '#424760'
local vis_light   = '#30354e'
local white       = '#ffffff'

-- }}}

-- Editor Highlight Groups {{{

hi('CursorLine'  , { bg = bg })
hi('Cursor'      , { fg = bg_dark, bg = yellow })
hi('Directory'   , { fg = blue, gui = 'bold' })
hi('DiffAdd'     , { fg = green })
hi('DiffChange'  , { fg = yellow })
hi('DiffDelete'  , { fg = red })
hi('DiffText'    , { fg = blue })
hi('EndOfBuffer' , { bg = bg_normal, fg = bg_normal })
hi('ErrorMsg'    , { fg = red, gui = 'bold' })
hi('VertSplit'   , { bg = "NONE", fg = bg })
hi('Folded'      , { fg = fg_dark, gui = 'italic' })
hi('FoldColumn'  , { fg = yellow })
hi('SignColumn'  , { fg = yellow })
hi('IncSearch'   , { bg = yellow, fg = bg })
hi('Substitute'  , { bg = blue, fg = bg })
hi('LineNr'      , { fg = fg_dark })
hi('CursorLineNr', { fg = fg })
hi('MatchParen'  , { fg = "NONE", bg = bg_light })
hi('Normal'      , { fg = fg_light, bg = bg_normal })
hi('NormalFloat' , { bg = bg_darker })
hi('Pmenu'       , { bg = bg_darker, fg = fg_light })
hi('PmenuSel'    , { bg = cyan, fg = bg_lighter, gui = 'bold' })
hi('PmenuSbar'   , { bg = bg_lighter })
hi('PmenuThumb'  , { bg = fg })
hi('Search'      , { bg = vis })
hi('SpellBad'    , { gui = 'underline', sp = red })
hi('SpellCap'    , { gui = 'underline', sp = yellow })
hi('SpellLocal'  , { gui = 'underline', sp = orange })
hi('SpellRare'   , { gui = 'underline', sp = blue })
hi('TabLine'     , { bg = bg, fg = fg_light })
hi('TabLineFill' , { bg = bg, fg = fg_light })
hi('TabLineSel'  , { bg = cyan, fg = bg_dark })
hi('Title'       , { fg = green })
hi('Visual'      , { bg = vis_light })
hi('VisualNOS'   , { bg = vis_light })
hi('WarningMsg'  , { fg = yellow, gui = 'italic' })
hi('Whitespace'  , { fg = fg_dark })

-- git highlighting
hi('gitcommitComment'        , { fg = fg_dark })
hi('gitcommitUntracked'      , { fg = fg_dark, gui = 'italic' })
hi('gitcommitDiscarded'      , { fg = fg_dark, gui = 'italic' })
hi('gitcommitSelected'       , { fg = fg_dark, gui = 'italic' })
hi('gitcommitUnmerged'       , { fg = green })
hi('gitcommitBranch'         , { fg = purple })
hi('gitcommitNoBranch'       , { fg = purple })
hi('gitcommitDiscardedType'  , { fg = red })
hi('gitcommitSelectedType'   , { fg = green })
hi('gitcommitUntrackedFile'  , { fg = cyan })
hi('gitcommitDiscardedFile'  , { fg = red })
hi('gitcommitDiscardedArrow' , { fg = red })
hi('gitcommitSelectedFile'   , { fg = green })
hi('gitcommitSelectedArrow'  , { fg = green })
hi('gitcommitUnmergedFile'   , { fg = yellow })
hi('gitcommitUnmergedArrow'  , { fg = yellow })
hi('gitcommitSummary'        , { fg = fg_light })
hi('gitcommitOverflow'       , { fg = red })
hi('gitcommitOnBranch'       , {})
hi('gitcommitHeader'         , {})
hi('gitcommitFile'           , {})

hi('Conceal'     , {})
hi('ModeMsg'     , {})
hi('MsgArea'     , {})
hi('MsgSeparator', {})
hi('MoreMsg'     , {})
hi('NonText'     , {})
hi('Question'    , {})
hi('QuickFixLine', {})
hi('StatusLine'  , {})
hi('StatusLineNC', { gui = "NONE", bg = "NONE", fg = "NONE" })
hi('WildMenu'    , {})

-- }}}

-- Vim Default Code Syntax {{{

hi('Comment'       , { fg = fg_dark })
hi('Constant'      , { fg = yellow })
hi('String'        , { fg = green })
hi('Character'     , { fg = green })
hi('Number'        , { fg = orange })
hi('Float'         , { fg = orange })
hi('Boolean'       , { fg = orange })

hi('Identifier'    , { fg = heavy_red })
hi('Function'      , { fg = cyan })

hi('Statement'     , { fg = blue })
hi('Conditional'   , { fg = purple })
hi('Repeat'        , { fg = purple })
hi('Label'         , { fg = cyan })
hi('Exception'     , { fg = cyan })
hi('Operator'      , { fg = purple })
hi('Keyword'       , { fg = purple })

hi('Include'       , { fg = blue })
hi('Define'        , { fg = purple })
hi('Macro'         , { fg = purple })
hi('PreProc'       , { fg = yellow })
hi('PreCondit'     , { fg = yellow })

hi('Type'          , { fg = yellow })
hi('StorageClass'  , { fg = yellow })
hi('Structure'     , { fg = yellow })
hi('Typedef'       , { fg = yellow })

hi('Special'       , { })
hi('SpecialChar'   , { })
hi('SpecialKey'    , {  fg = fg_light })
hi('Tag'           , { fg = orange })
hi('SpecialComment', { fg = fg_dark, gui = 'bold' })
hi('Debug'         , {})
hi('Delimiter'     , {})

hi('Ignore'        , {})
hi('Underlined'    , { gui = 'underline' })
hi('Error'         , { fg = heavy_red })
hi('Todo'          , { fg = purple, gui = 'bold' })

-- }}}

-- Lsp Highlight {{{

hi('LspDiagnosticsDefaultError'      , { fg = red })
hi('LspDiagnosticsDefaultWarning'    , { fg = yellow })
hi('LspDiagnosticsDefaultHint'       , { fg = green })
hi('LspDiagnosticsDefaultMessage'    , { fg = fg })

hi('LspDiagnosticsFloatingError'     , { fg = red, gui = 'underline' })
hi('LspDiagnosticsFloatingWarning'   , { fg = yellow, gui = 'underline' })
hi('LspDiagnosticsFloatingHint'      , { fg = green, gui = 'underline' })
hi('LspDiagnosticsFloatingMessage'   , { fg = fg, gui = 'underline' })

hi('LspDiagnosticsSignError'         , { fg = red, gui = 'italic' })
hi('LspDiagnosticsSignWarning'       , { fg = yellow, gui = 'italic' })
hi('LspDiagnosticsSignHint'          , { fg = green, gui = 'italic' })
hi('LspDiagnosticsSignMessage'       , { fg = fg, gui = 'italic' })

hi('LspDiagnosticsUnderlineError'    , { gui = 'underline' })
hi('LspDiagnosticsUnderlineWarning'  , { gui = 'underline' })
hi('LspDiagnosticsUnderlineHint'     , { gui = 'underline' })
hi('LspDiagnosticsUnderlineMessage'  , { gui = 'underline' })

hi('LspDiagnosticsVirtualTextError'  , { fg = red, gui = 'bold' })
hi('LspDiagnosticsVirtualTextWarning', { fg = yellow, gui = 'bold' })
hi('LspDiagnosticsVirtualTextHint'   , { fg = green, gui = 'bold' })
hi('LspDiagnosticsVirtualTextMessage', { fg = fg, gui = 'bold' })

-- }}}

-- tree-sitter highlight {{{

hi("TSAnnotation",  { fg = red })
hi("TSBoolean", { fg = orange })
hi("TSCharacter", { fg = green, gui = 'bold' })
hi("TSConstBuiltin", { fg = blue })
hi("TSConstMacro", { fg = blue })
hi("TSConstructor", { fg = yellow })
hi("TSFuncBuiltin", { fg = blue })
hi("TSVariableBuiltin", { fg = blue })

-- }}}

-- Setting Neovim Terminal Color {{{

vim.g.terminal_color_0          = bg_dark
vim.g.terminal_color_1          = red
vim.g.terminal_color_2          = green
vim.g.terminal_color_3          = yellow
vim.g.terminal_color_4          = blue
vim.g.terminal_color_5          = purple
vim.g.terminal_color_6          = cyan
vim.g.terminal_color_7          = fg
vim.g.terminal_color_8          = grey
vim.g.terminal_color_9          = red
vim.g.terminal_color_10         = green
vim.g.terminal_color_11         = orange
vim.g.terminal_color_12         = blue
vim.g.terminal_color_13         = purple
vim.g.terminal_color_14         = cyan
vim.g.terminal_color_15         = white
vim.g.terminal_color_background = bg_dark
vim.g.terminal_color_foreground = fg_light

-- }}}
