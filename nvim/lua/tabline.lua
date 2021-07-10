-- define some colors
local bar_fg = "#565c64"
local bar_bg = '#121622'
local selected_bgfg = '#171b27'
local activeBuffer_fg = "#c8ccd4"

require[[bufferline]].setup {
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {{filetype = "NvimTree", text = "Explorer"}},
		buffer_close_icon = "",
		modified_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
		show_tab_indicators = true,
		enforce_regular_tabs = false,
		view = "multiwindow",
		show_close_icon = false,
		show_buffer_close_icons = true,
		separator_style = "thick",
		mappings = "true",
		sort_by = "extension"
	},
	-- bar colors!!
	highlights = {
		fill = {
			guifg = bar_fg,
			guibg = bar_bg
		},
		background = {
			guifg = bar_fg,
			guibg = bar_bg
		},
		-- buffer
		buffer_selected = {
			guifg = activeBuffer_fg,
			guibg = selected_bgfg,
			gui = "bold"
		},
		buffer_visible = {
			guifg = "#9298a0",
			guibg = bar_bg
		},
		-- buffer separators
		separator = {
			guifg = bar_bg,
			guibg = bar_bg
		},
		separator_selected = {
			guifg = selected_bgfg,
			guibg = selected_bgfg
		},
		separator_visible = {
			guifg = bar_bg,
			guibg = bar_bg
		},
		indicator_selected = {
			guifg = bar_bg,
			guibg = bar_bg
		},
		-- modified files (but not saved)
		modified_selected = {
			guifg = "#A3BE8C",
			guibg = selected_bgfg
		},
		modified_visible = {
			guifg = "#BF616A",
			guibg = "#23272f"
		}
	}
}
