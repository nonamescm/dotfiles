local colors = require("colors")

-- 1. Create a custom theme based on your Galaxyline colors
local theme = {
	normal = {
		a = {
			fg = colors.black,
			bg = colors.green,
			gui = "bold"
		},
		b = {
			fg = colors.green,
			bg = colors.black,
		},
		c = {
			fg = colors.fg,
			bg = colors.black2,
		},
	},
	insert = {
		a = {
			fg = colors.black,
			bg = colors.blue,
			gui = "bold"
		}
	},
	visual = {
		a = {
			fg = colors.black,
			bg = colors.purple,
			gui = "bold"
		} 
	},
	replace = {
		a = {
			fg = colors.black,
			bg = colors.red,
			gui = "bold"
		} 
	},
	inactive = {
		a = {
			fg = colors.fg,
			bg = colors.black,
			gui = "bold"
		},
		b = {
			fg = colors.fg,
			bg = colors.black
		},
		c = {
			fg = colors.fg,
			bg = colors.black
		},
	},
}

require('lualine').setup({
	options = {
		theme = theme,
		component_separators = '',
		section_separators = { left = '', right = '' }, -- Matches your slanted separators
		disabled_filetypes = { 'packer' },
		globalstatus = true,
	},
	sections = {
		lualine_a = {
			{ 
				function() return "" end, 
				padding = { left = 2, right = 1 } 
			},
		},
		lualine_b = {
			{ 'branch', icon = '', color = { fg = colors.green } },
			{ 
				'diff', 
				symbols = { added = ' ', modified = ' ', removed = ' ' },
				diff_color = {
					added = { fg = colors.purple },
					modified = { fg = colors.blue },
					removed = { fg = colors.red },
				},
			},
		},
		lualine_c = {
			{
				'filetype',
				icon_only = true,
				separator = '',
				padding = { left = 1, right = 0 }
			},
			{ 
				'filename', 
				file_status = true, 
				path = 0,
				symbols = { unnamed = 'Empty buffer' },
				padding = { left = 0, right = 0 }
			},
		},
		lualine_x = {
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.yellow },
					info = { fg = colors.blue },
					hint = { fg = colors.green },
				},
			},
		},
		lualine_y = {
			{
        function() return "" end,
        color = { fg = colors.blue, bg = colors.black2 },
        padding = { left = 1, right = 0 },
			},
			{
				function()
					local folder = vim.fn.expand("%:p:h")
					local cwd = vim.fn.getcwd()
					if folder:sub(1, cwd:len()) == cwd then
						local _, bound = folder:find(cwd, nil, true)
						return "." .. folder:sub(bound + 1)
					else
						return folder
					end
				end,
				color = { fg = colors.fg, bg = colors.black2 },
			}
		},
		lualine_z = {
			{ 'location', color = { fg = colors.fg, bg = colors.black2 } }
		},
	},
})

