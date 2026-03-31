local colors = require("colors")
	require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = "slant",
    always_show_bufferline = true,
    show_buffer_close_icons = true,
    show_close_icon = false,
    color_icons = true,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        separator = true,
      },
    },
		indicator = {
			style = "underline"
		}
  },

  highlights = {
    buffer_selected = {
      fg = colors.white,
      bg = colors.lightbg,
      bold = true,
      italic = false,
    },

    numbers_selected = {
      fg = colors.cyan,
      bg = colors.lightbg,
      bold = true,
    },

    diagnostic_selected = {
      fg = colors.red,
      bg = colors.lightbg,
      bold = true,
    },

    hint_selected = {
      fg = colors.green,
      bg = colors.lightbg,
    },

    info_selected = {
      fg = colors.blue,
      bg = colors.lightbg,
    },

    warning_selected = {
      fg = colors.yellow,
      bg = colors.lightbg,
    },

    error_selected = {
      fg = colors.red,
      bg = colors.lightbg,
    },

    buffer = {
      fg = colors.fg,
      bg = colors.bg,
    },

    numbers = {
      fg = colors.purple,
      bg = colors.bg,
    },

    diagnostic = {
      fg = colors.red,
      bg = colors.bg,
    },

    hint = {
      fg = colors.green,
      bg = colors.bg,
    },

    info = {
      fg = colors.blue,
      bg = colors.bg,
    },

    warning = {
      fg = colors.yellow,
      bg = colors.bg,
    },

    error = {
      fg = colors.red,
      bg = colors.bg,
    },

    fill = {
      bg = colors.black2,
    },

    separator = {
      fg = colors.black2,
      bg = colors.bg,
    },

    separator_selected = {
      fg = colors.black2,
      bg = colors.lightbg,
    },

    separator_visible = {
      fg = colors.black2,
      bg = colors.bg,
    },

    close_button = {
      fg = colors.grey_fg,
      bg = colors.bg,
    },

    close_button_selected = {
      fg = colors.red,
      bg = colors.lightbg,
    },

    close_button_visible = {
      fg = colors.grey_fg,
      bg = colors.bg,
    },

    modified = {
      fg = colors.orange,
      bg = colors.bg,
    },

    modified_selected = {
      fg = colors.orange,
      bg = colors.lightbg,
    },

    duplicate = {
      fg = colors.purple,
      bg = colors.bg,
      italic = true,
    },

    duplicate_selected = {
      fg = colors.purple,
      bg = colors.lightbg,
      italic = true,
    },

    pick = {
      fg = colors.red,
      bg = colors.bg,
      bold = true,
    },

    pick_selected = {
      fg = colors.green,
      bg = colors.lightbg,
      bold = true,
    },
  },
})
