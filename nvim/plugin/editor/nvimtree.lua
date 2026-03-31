-- to see the full config and check for
-- possible options in the future, run
-- `:lua require("neo-tree").paste_default_config()`

require("neo-tree").setup({
	close_if_last_window = true,
	enable_git_status = false,
	event_handlers = {
		{
			event = "before_render",
			handler = function(state)
				vim.cmd("highlight link NeoTreeDirectoryIcon Function")
				vim.cmd("highlight NeoTreeRootName gui=none")
				vim.cmd("highlight link NeoTreeRootName String")
			end
		},
	},
	window = {
		width = 25,
	},
	filesystem = {
		filtered_items = {
			visible = true,
		}
	}
})
