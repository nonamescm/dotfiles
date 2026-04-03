-- to see the full config and check for
-- possible options in the future, run
-- `:lua require("neo-tree").paste_default_config()`

local colors = require("colors")

require("neo-tree").setup({
	close_if_last_window = false,
	enable_git_status = false,
	event_handlers = {
		{
			event = "before_render",
			handler = function(state)
				vim.cmd("highlight link NeoTreeDirectoryIcon Function")
				vim.cmd("highlight link NeoTreeRootName String")
			end
		},
	},
	popup_border_style = "double",
	window = {
		width = 25,
		mappings = {
			["<C-[>"] = "navigate_up",
			["<C-]>"] = "set_root",
		}
	},
	filesystem = {
		filtered_items = {
			visible = true,
		}
	},
})
