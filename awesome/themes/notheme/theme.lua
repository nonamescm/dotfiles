-- vim:fdm=marker
local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local naughty = require("naughty")
local dpi = require("beautiful.xresources").apply_dpi
local my_table = awful.util.table

-- Theme Definition {{{
local theme = {}
theme.dir = os.getenv("HOME").."/.config/awesome/themes/notheme/"

-- Fonts
theme.font = "Iosevka Nerd Font 9"
theme.taglist_font = "FiraMono Nerd Font Mono 15"
theme.icon_font = "Iosevka Nerd Font 15"
theme.exit_screen_font = "FiraMono Nerd Font Mono 120"
theme.widget_font = 'Iosevka Nerd Font 10'
theme.notification_font = "Iosevka Nerd Font 12"
theme.tasklist_font = "Iosevka Nerd Font 7"

-- colors
theme.clr = {
	purple = "#c792ea",
	blue = "#82aaff",
	green = "#7cd380",
	red = '#ff5370',
	gray = '#8796b0',
	yellow = '#ffcb8b'
}
theme.fg_normal = '#424760'
theme.fg_focus = '#a6accd'
theme.fg_urgent = '#424760'

theme.bg_normal = '#121622'
theme.bg_focus = '#121622'
theme.bg_urgent = "#081218"
theme.bg_light = '#1f1f2f'
theme.bg_systray = theme.bg_light

theme.tasklist_bg_normal = '#181828'
theme.tasklist_bg_focus = '#1f1f2f'
theme.tasklist_bg_urgent = '#1b1b2b'

theme.taglist_bg_urgent = "#2f2f3f"
theme.taglist_bg_focus = "#2f2f3f"
theme.taglist_fg_occupied = theme.clr.blue
theme.taglist_fg_urgent = theme.clr.red
theme.taglist_fg_empty = theme.clr.gray
theme.taglist_fg_focus = theme.clr.green

theme.notification_fg = '#a6accd'
theme.notification_bg = '#121622'
theme.notification_opacity = 1

theme.border_normal = '#20253e'
theme.border_focus = '#545277'
theme.border_marked = '#424760'

theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = true
theme.useless_gap = dpi(4)
theme.gap_single_client = true

-- assests
theme.titlebar_close_button_normal = theme.dir.."./assets/close-button.svg"
theme.titlebar_close_button_focus = theme.dir.."./assets/close-button.svg"

theme.titlebar_minimize_button_normal = theme.dir.."./assets/minimize-button.svg"
theme.titlebar_minimize_button_focus = theme.dir.."./assets/minimize-button.svg"

theme.titlebar_maximized_button_normal = theme.dir.."./assets/maximized-button.svg"
theme.titlebar_maximized_button_focus = theme.dir.."./assets/maximized-button.svg"

theme.layout_fairh = theme.dir.."layouts/fairhw.png"
theme.layout_fairv = theme.dir.."layouts/fairvw.png"
theme.layout_floating  = theme.dir.."layouts/floatingw.png"
theme.layout_magnifier = theme.dir.."layouts/magnifierw.png"
theme.layout_max = theme.dir.."layouts/maxw.png"
theme.layout_fullscreen = theme.dir.."layouts/fullscreenw.png"
theme.layout_tilebottom = theme.dir.."layouts/tilebottomw.png"
theme.layout_tileleft   = theme.dir.."layouts/tileleftw.png"
theme.layout_tile = theme.dir.."layouts/tilew.png"
theme.layout_tiletop = theme.dir.."layouts/tiletopw.png"
theme.layout_spiral  = theme.dir.."layouts/spiralw.png"
theme.layout_dwindle = theme.dir.."layouts/dwindlew.png"
theme.layout_cornernw = theme.dir.."layouts/cornernww.png"
theme.layout_cornerne = theme.dir.."layouts/cornernew.png"
theme.layout_cornersw = theme.dir.."layouts/cornersww.png"
theme.layout_cornerse = theme.dir.."layouts/cornersew.png"

-- naughty configuration
theme.notification_border_color = theme.bg_light
theme.notification_border_width = dpi(5)

naughty.config.padding = dpi(8)
naughty.config.defaults = {
	timeout = 5,
	text = "",
	ontop = true,
	position = "top_right",
	margin = dpi(10),
}

-- }}}

-- widgets {{{
-- Clock
local clockicon = wibox.widget.textbox(
	string.format('<span color="%s" font="'..theme.icon_font..'"></span>', theme.clr.purple)
)
local clock = wibox.widget.textclock(
	'<span font="'..theme.widget_font..'" color="'..theme.clr.purple..'"> %R</span>'
)

-- Calendar
local calendaricon = wibox.widget.textbox(
	string.format('<span color="%s" font="'..theme.icon_font..'"></span>', theme.clr.yellow)
)
local calendar = wibox.widget.textclock(
	'<span font="'..theme.widget_font..'" color="'..theme.clr.yellow..'"> %x</span>'
)


-- Battery
local baticon = wibox.widget.textbox(
	string.format('<span color="%s" font="'..theme.icon_font..'"></span>', theme.clr.blue)
)

local bat = wibox.widget.textbox('')
theme.update_battery = function()
	awful.spawn.easy_async_with_shell(
	[[bash -c "echo $(acpi|awk '{split($0,a,", "); print a[2]}')"]],
	function(stdout)
		if stdout == '' then
			bat:set_markup('<span color="'..theme.clr.blue..'" font="'..theme.widget_font..'"> N/A</span>')
		else
			bat:set_markup('<span color="'..theme.clr.blue..'" font="'..theme.widget_font..'"> ' ..stdout.."%</span> ")
		end
	end)
end
theme.update_battery()

-- ALSA volume
local volicon = wibox.widget.textbox('')
local vol = wibox.widget.textbox('')
theme.update_volume = function()
	awful.spawn.easy_async_with_shell([[
		if amixer get Master | sed 5q | grep -q '\[on\]'; then
			echo $(awk -F'[][]' '/dB/ { print $2 }' <(amixer sget Master))
		else
			echo 'muted'
		fi
	]], function(stdout)
		stdout = tostring(stdout):gsub("\n", '')
		if stdout == "muted" then
			volicon:set_markup('<span color="'..theme.clr.green..'" font="'..theme.icon_font..'">婢</span>')
		elseif stdout == "0%" then
			volicon:set_markup('<span color="'..theme.clr.green..'" font="'..theme.icon_font..'"></span>')
			vol:set_markup('<span color="'..theme.clr.green..'" font="'..theme.widget_font..'"> '..stdout.."</span> ")
		else
			volicon:set_markup('<span color="'..theme.clr.green..'" font="'..theme.icon_font..'">墳</span>')
			vol:set_markup('<span color="'..theme.clr.green..'" font="'..theme.widget_font..'"> '..stdout.."</span> ")
		end
	end)
end
theme.update_volume()

-- Separators
local spr = wibox.widget.textbox('     ')
local half_spr = wibox.widget.textbox('  ')

-- power
local power_menu = { }
local power = wibox.widget.textbox('<span font="'..theme.icon_font..'" color="'..theme.fg_focus..'"></span>')

power:connect_signal("mouse::enter", function()
	power:set_markup('<span font="'..theme.icon_font..'" color="'..theme.clr.blue..'"></span>')
end)

power:connect_signal("mouse::leave", function()
	power:set_markup('<span font="'..theme.icon_font..'" color="'..theme.fg_focus..'"></span>')
end)

power:connect_signal("button::press", function()
	if power_menu.visible == nil then
		local logout = wibox.widget.textbox(
			'<span font="'..theme.exit_screen_font..'" color="'..theme.clr.purple..'"></span>'
		)

		local poweroff = wibox.widget.textbox(
			'<span font="'..theme.exit_screen_font..'" color="'..theme.clr.blue..'">⏻</span>'
		)

		local reboot = wibox.widget.textbox(
			'<span font="'..theme.exit_screen_font..'" color="'..theme.clr.green..'">ﰇ</span>'
		)

		local close = wibox.widget.textbox(
			'<span font="'..theme.exit_screen_font..'" color="'..theme.clr.red..'"></span>'
		)
		power_menu = awful.popup {
			ontop = true,
			visible = true,
			bg = theme.bg_light.."cc",
			fg = theme.fg_focus,
			placement = awful.placement.maximize,
			widget = {
				{
					{
						{
							{
								spr,
								layout = wibox.layout.fixed.horizontal,
							},
							widget = wibox.container.place,
						},
						{
							{
								spr, spr, spr,
								spr, spr,
								logout,
								spr, spr, spr,
								spr, spr,
								poweroff,
								spr, spr, spr,
								spr, spr,
								reboot,
								spr, spr, spr,
								spr, spr,
								layout = wibox.layout.fixed.horizontal,
							},
							widget = wibox.container.place,
						},
						{
							{
								close,
								layout = wibox.layout.align.horizontal,
							},
							widget = wibox.container.place,
						},
						layout = wibox.layout.fixed.vertical,
					},
					margins = dpi(20),
					widget = wibox.container.margin
				},
				widget = wibox.container.background,
			},
		}

		logout:connect_signal("button::press", function()
			awful.util.spawn("pkill X")
		end)

		poweroff:connect_signal("button::press", function()
			awful.util.spawn("doas poweroff")
		end)

		reboot:connect_signal("button::press", function()
			awful.util.spawn("doas reboot")
		end)
		close:connect_signal("button::press", function()
			power_menu.visible = false
		end)
	else power_menu.visible = not power_menu.visible end
end)
-- }}}

-- load theme options {{{
function theme.at_screen_connect(s)
	gears.wallpaper.maximized(theme.dir.."/tile.jpeg", s)

	-- Tags
	awful.tag(awful.util.tagnames, s, awful.layout.layouts)

	-- Create a promptbox for each screen
	s.mypromptbox = awful.widget.prompt()
	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(my_table.join(awful.button({}, 1, function()
		awful.layout.inc(1)
	end), awful.button({}, 2, function()
		awful.layout.set(awful.layout.layouts[1])
	end), awful.button({}, 3, function()
		awful.layout.inc(-1)
	end), awful.button({}, 4, function()
		awful.layout.inc(1)
	end), awful.button({}, 5, function()
		awful.layout.inc(-1)
	end)))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist {
		screen = s,
		filter = awful.widget.taglist.filter.all,
		style = {
			shape = gears.shape.rounded_rect
		},
		layout = {
			spacing = 0,
			spacing_widget = {
				color = theme.fg_normal,
				shape = gears.shape.rounded_rect,
			},
			layout = wibox.layout.fixed.horizontal
		},
		widget_template = {
			{
				{
					{
						bg = theme.fg_normal,
						shape = '',
						widget = wibox.container.background,
					},
					{
						{
							id = 'icon_role',
							widget = wibox.widget.imagebox,
						},
						margins = 0,
						widget = wibox.container.margin,
					},
					{
						id = 'text_role',
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.align.horizontal,
				},
				left = 10,
				right = 10,
				widget = wibox.container.margin
			},
			id = 'background_role',
			widget = wibox.container.background,
		},
		buttons = awful.util.taglist_buttons
	}
	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist {
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
		buttons = awful.util.tasklist_buttons,
		style = {
			shape = gears.shape.rounded_rect,
			shape_border_width = dpi(1),
			shape_border_color = theme.bg_normal,
		},
		layout = {
			spacing = dpi(20),
			spacing_widget = {
				{
					forced_width = dpi(5),
					shape = gears.shape.circle,
					widget = wibox.widget.separator
				},
				valign = 'center',
				halign = 'center',
				widget = wibox.container.place,
			},
			layout = wibox.layout.flex.horizontal
		},
		-- Notice that there is *NO* wibox.wibox prefix, it is a template,
		-- not a widget instance.
		widget_template = {
			{
				{
					{
						{
							id = 'icon_role',
							widget = wibox.widget.imagebox,
						},
						margins = dpi(0),
						widget = wibox.container.margin,
					},
					{
						id = 'text_role',
						forced_height = dpi(32),
						widget = wibox.widget.textbox,
					},
					layout = wibox.layout.fixed.horizontal,
				},
				left = dpi(10),
				right = dpi(10),
				widget = wibox.container.margin
			},
			id = 'background_role',
			widget = wibox.container.background,
		}
	}

	s.wibox = awful.wibar {
		width = dpi(1366),
		height = dpi(38),
		ontop = false,
		screen = mouse.screen,
		expand = true,
		visible = true,
		bg = theme.bg_normal,
	}
	s.wibox:setup {
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			{
				layout = wibox.layout.fixed.horizontal,
				{
					{
						layout = wibox.layout.align.horizontal,
						half_spr,
						power,
						half_spr
					},
					widget = wibox.container.background,
					bg = theme.bg_light,
					shape = gears.shape.rounded_rect
				},
				half_spr,
				{
					{
						layout = wibox.layout.align.horizontal,
						s.mytaglist,
					},
					bg = theme.bg_light,
					shape = gears.shape.rounded_rect,
					widget = wibox.container.background,
				},
			},
			widget = wibox.container.margin,
			top = dpi(5),
			bottom = dpi(5),
			right = dpi(5),
			left = dpi(5)
		},
		{ -- Center widgets
			layout = wibox.layout.align.horizontal,
			s.mypromptbox,
			{
				{
					layout = wibox.layout.flex.vertical,
					s.mytasklist,
				},
				widget = wibox.container.place,
				fill_horizontal = true
			},
		},
		{
			{
				layout = wibox.layout.fixed.horizontal,
				{
					{
						layout = wibox.layout.fixed.horizontal,
						half_spr,
						clockicon,
						clock,
						half_spr
					},
					bg = theme.bg_light,
					shape = gears.shape.rounded_rect,
					widget = wibox.container.background,
				},
				half_spr,
				{
					{
						layout = wibox.layout.fixed.horizontal,
						half_spr,
						calendaricon,
						calendar,
						half_spr
					},
					bg = theme.bg_light,
					shape = gears.shape.rounded_rect,
					widget = wibox.container.background,
				},
				half_spr,
				{
					{
						layout = wibox.layout.fixed.horizontal,
						half_spr,
						volicon,
						vol,
						half_spr,
					},
					bg = theme.bg_light,
					shape = gears.shape.rounded_rect,
					widget = wibox.container.background,
				},
				half_spr,
				{
					{
						layout = wibox.layout.fixed.horizontal,
						half_spr,
						baticon,
						bat,
						half_spr,
					},
					bg = theme.bg_light,
					shape = gears.shape.rounded_rect,
					widget = wibox.container.background,
				},
				half_spr,
				{
					{
						{
							layout = wibox.layout.align.horizontal,
							s.mylayoutbox
						},
						widget = wibox.container.margin,
						margins = dpi(5),
					},
					widget = wibox.container.background,
					bg = theme.bg_light,
					shape = gears.shape.rounded_rect
				},
				half_spr,
				{
					{
						layout = wibox.layout.fixed.horizontal,
						half_spr,
						wibox.container.margin(
							wibox.widget.systray(),
							dpi(6), dpi(6), dpi(6), dpi(6)
						),
						half_spr,
					},
					bg = theme.bg_light,
					shape = gears.shape.rounded_rect,
					widget = wibox.container.background,
				},
				half_spr,
			},
			widget = wibox.container.margin,
			top = dpi(5),
			bottom = dpi(5),
			right = dpi(5),
			left = dpi(5)
		},
	}
end
-- }}}

return theme
