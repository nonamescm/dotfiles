local g = vim.g

g.nvim_tree_side = "left"
g.nvim_tree_width = 30
g.nvim_tree_allow_resize = 1

-- Mappings for nvimtree

vim.api.nvim_set_keymap(
	"n",
	"<C-n>",
	":NvimTreeToggle<CR>",
	{
		noremap = true,
		silent = true
	}
)

local hi = require("functions.highlight")
local colors = require("colors")
require("nvim-tree").setup({
	renderer = {
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = false,
			},
			glyphs = {
				default = " ",
				symlink = " ",
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★"
				}
			},
		},
		root_folder_modifier = ":~",
		highlight_git = false,
	},
})

hi("NvimTreeFolderIcon", { guifg = colors.blue })
hi("NvimTreeEndOfBuffer", { guibg = colors.bg, guifg = colors.bg })
hi("NvimTreeNormal", { guibg = colors.bg })
