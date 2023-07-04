local nvtree = require("nvim-tree")
local events = require("nvim-tree.api").events

nvtree.setup({
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

events.subscribe(events.Event.TreeOpen, function()
	vim.cmd("setlocal ts=2")
end)
