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

