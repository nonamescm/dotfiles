local g = vim.g

g.nvim_tree_side = "left"
g.nvim_tree_width = 30
-- g.nvim_tree_auto_open = 0
-- g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 1
-- g.nvim_tree_follow = 1

g.nvim_tree_git_hl = 0
g.nvim_tree_root_folder_modifier = ":~"
-- g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 1

g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 1,
	folder_arrows = 1,
}

g.nvim_tree_icons = {
	default = " ",
	symlink = " ",
	git = {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★"
	},
}

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
local colors = require('colors')
require('nvim-tree').setup {
	nvim_tree_hide_dotfiles = 1,
	nvim_tree_ignore = {".git", "node_modules", ".cache", "target"}
}

hi("NvimTreeFolderIcon", { guifg = colors.blue })
hi("NvimTreeEndOfBuffer", { guibg = colors.bg, guifg = colors.bg })
hi("NvimTreeNormal", { guibg = colors.bg })
