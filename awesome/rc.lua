-- vim:fdm=marker
local awesome, client, root, screen = awesome, client, root, screen
local wibox = require('wibox')
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local beautiful = require("beautiful")
local naughty = require("naughty")
local my_table = awful.util.table or gears.table
local dpi = require('beautiful.xresources').apply_dpi

-- startup and general utilities {{{
local function move_tag(pos)
	local tag = awful.screen.focused().selected_tag
	if tonumber(pos) <= -1 then
		awful.tag.move(tag.index - 1, tag)
	else
		awful.tag.move(tag.index + 1, tag)
	end
end

-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		if in_error then
			return
		end
		in_error = true
		naughty.notify({
				preset = naughty.config.presets.critical,
				title = "Oops, an error happened!",
				text = tostring(err)
			})
		in_error = false
	end)
end
-- }}}

-- Choose theme {{{
local themes = {
	"notheme"
}

local chosen_theme = themes[1]
local modkey = "Mod4"
local altkey = "Mod1"

awful.util.tagnames = {'', '', '', '', ''}
awful.layout.layouts = {
	awful.layout.suit.corner.nw,
	awful.layout.suit.tile.top,
	awful.layout.suit.tile.right,
}
-- }}}

-- Buttons {{{
-- tags keybinds {{{
awful.util.taglist_buttons = my_table.join(awful.button({}, 1, function(t)
	t:view_only()
end), awful.button({modkey}, 1, function(t)
	if client.focus then
		client.focus:move_to_tag(t)
	end
end), awful.button({}, 3, awful.tag.viewtoggle), awful.button({modkey}, 3, function(t)
	if client.focus then
		client.focus:toggle_tag(t)
	end
end), awful.button({}, 5, function(t)
	awful.tag.viewnext(t.screen)
end), awful.button({}, 4, function(t)
	awful.tag.viewprev(t.screen)
end))
-- }}}

-- tasks keybinds {{{
awful.util.tasklist_buttons = my_table.join(awful.button({}, 1, function(c)
	if c == client.focus then
		c.minimized = true
	else
		-- Without this, the following
		-- :isvisible() makes no sense
		c.minimized = false
		if not c:isvisible() and c.first_tag then
			c.first_tag:view_only()
		end
		-- This will also un-minimize
		-- the client, if needed
		client.focus = c
		c:raise()
	end
end), awful.button({}, 2, function(c)
	c:kill()
end), awful.button({}, 4, function()
	awful.client.focus.byidx(1)
end), awful.button({}, 5, function()
	awful.client.focus.byidx(-1)
end))
-- }}}

-- global keybinds {{{
local globalkeys = my_table.join(
	awful.key(
		{altkey},
		"Tab",
		function()
			awful.client.focus.byidx(1)
			if _G.client.focus then
				_G.client.focus:raise()
			end
		end,
		{ description = 'Switch to next window', group = 'client'
	}), awful.key({modkey}, "Left", awful.tag.viewprev, {
		description = "view previous",
		group = "tag"
	}), awful.key({modkey}, "Right", awful.tag.viewnext, {
		description = "view next",
		group = "tag"
	}), awful.key({modkey}, "d", function()
			local bar = awful.screen.focused().mywibox
			bar.visible = not bar.visible
	end, {
		description = "toggle wibox",
		group = "awesome"
	}), awful.key({modkey}, "t", function()
			awful.prompt.run {
				prompt = "New tag name: ",
				textbox = awful.screen.focused().mypromptbox.widget,
				exe_callback = function(new_name)
					if not new_name or #new_name == 0 then return end
					local t = awful.screen.focused().selected_tag
					if t then
						t.name = new_name
					end
				end
			}
	end, {
		description = "rename tag",
		group = "tag"
	}), awful.key({altkey, "Control"}, "Left", function()
		move_tag(-1)
	end, {
		description = "move tag to the left",
		group = "tag"
	}), awful.key({altkey, "Control"}, "Right", function()
		move_tag(1)
	end, {
		description = "move tag to the right",
		group = "tag"
	}), awful.key({modkey}, "Return", function()
		awful.util.spawn("x-terminal-emulator")
	end, {
		description = "open a terminal",
		group = "launcher"
	}), awful.key({modkey, "Control"}, "r", awesome.restart, {
		description = "reload awesome",
		group = "awesome"
	}), awful.key({modkey, "Shift"}, "q", awesome.quit, {
		description = "quit awesome",
		group = "awesome"
	}), awful.key({}, "XF86MonBrightnessUp", function()
		os.execute("xbacklight -inc 5")
	end, {
		description = "+5",
		group = "hotkeys"
	}), awful.key({}, "XF86MonBrightnessDown", function()
		os.execute("xbacklight -dec 5")
	end, {
		description = "-5%",
		group = "hotkeys"
	}), awful.key({}, "XF86AudioRaiseVolume", function()
		os.execute("amixer -q sset 'Master' 1%+")
		beautiful.update_volume()
	end, {
		description = "volume up",
		group = "hotkeys"
	}), awful.key({}, "XF86AudioLowerVolume", function()
		os.execute("amixer -q sset 'Master' 1%-")
		beautiful.update_volume()
	end, {
		description = "volume down",
		group = "hotkeys"
	}), awful.key({}, "XF86AudioMute", function()
		os.execute("amixer -q sset 'Master' toggle")
		beautiful.update_volume()
	end, {
		description = "toggle mute",
		group = "hotkeys"
	}), awful.key({altkey}, "space", function()
		awful.spawn("rofi -show drun")
	end, {
		description = "app launcher",
		group = "launcher"
	}), awful.key({modkey}, "r", function()
		awful.screen.focused().mypromptbox:run()
	end, {
		description = "execute command",
		group = "awesome"
}))
-- }}}

-- client keybinds {{{
local clientkeys = my_table.join(
	awful.key({ modkey }, "space", function(_)
		awful.layout.inc(1)
	end, {
		description = "select previous",
		group = "layout"
	}), awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
	end, {
		description = "magnify client",
		group = "client"
	}), awful.key({modkey}, "f", function(c)
		mouse.screen.mywibox.visible = c.fullscreen
		c.fullscreen = not c.fullscreen
		c:raise()
	end, {
		description = "toggle fullscreen",
		group = "client"
	}), awful.key({modkey}, "q", function(c)
		c:kill()
	end, {
		description = "close",
		group = "client"
	}), awful.key({modkey, "Control"}, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, {
		description = "move to master",
		group = "client"
	}), awful.key({modkey}, "o", function(c)
		c:move_to_screen()
	end, {
		description = "move to screen",
		group = "client"
	}), awful.key({modkey, "Control"}, "Up", function(c)
		if c.floating then
			c:relative_move(0, 0, 0, -20)
		else
			awful.client.incwfact(0.025)
		end
	end, {
		description = "Floating Resize Vertical -",
		group = "client"
	}), awful.key({modkey, "Control"}, "Down", function(c)
		if c.floating then
			c:relative_move(0, 0, 0, 20)
		else
			awful.client.incwfact(-0.025)
		end
	end, {
		description = "Floating Resize Vertical +",
		group = "client"
	}), awful.key({modkey, "Control"}, "Left", function(c)
		if c.floating then
			c:relative_move(0, 0, -20, 0)
		else
			awful.tag.incmwfact(-0.025)
		end
	end, {
		description = "Floating Resize Horizontal -",
		group = "client"
	}), awful.key({modkey, "Control"}, "Right", function(c)
		if c.floating then
			c:relative_move(0, 0, 20, 0)
		else
			awful.tag.incmwfact(0.025)
		end
	end, {
		description = "Floating Resize Horizontal +",
		group = "client"
	}), awful.key({modkey, "Shift"}, "Down", function(c)
		c:relative_move(0, 20, 0, 0)
	end, {
		description = "Floating Move Down",
		group = "client"
	}), awful.key({modkey, "Shift"}, "Up", function(c)
		c:relative_move(0, -20, 0, 0)
	end, {
		description = "Floating Move Up",
		group = "client"
	}), awful.key({modkey, "Shift"}, "Left", function(c)
		c:relative_move(-20, 0, 0, 0)
	end, {
		description = "Floating Move Left",
		group = "client"

	}), awful.key({modkey, "Shift"}, "Right", function(c)
		c:relative_move(20, 0, 0, 0)
	end, {
		description = "Floating Move Right",
		group = "client"
}))
-- }}}

-- Set keys
root.keys(globalkeys)
-- }}}

-- Rules to apply to new clients. {{{
awful.rules.rules = {{
	rule = {},
	properties = {
		titlebars_enabled = true,
		maximized_horizontal = false,
		maximized_vertical = false,
		maximized = false,
		border_width = 1.2,
		border_color = beautiful.border_normal,
		focus = awful.client.focus.filter,
		raise = true,
		keys = clientkeys,
		buttons = clientbuttons,
		screen = awful.screen.preferred,
		placement = awful.placement.no_overlap + awful.placement.no_offscreen,
		size_hints_honor = false,
	}
}}
-- }}}

-- Signals handlers {{{
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", {
		raise = vi_focus
	})
end)

client.connect_signal("focus", function(c)
	c.border_color = beautiful.border_focus
	beautiful.update_battery() -- update battery status when focus change
end)
client.connect_signal("unfocus", function(c)
	c.border_color = beautiful.border_normal
	beautiful.update_battery() -- update battery status when focus change
end)

client.connect_signal('request::display', function(n)
	naughty.layout.box {notification = n}
end)

-- add gaps to new clients
client.connect_signal('request::titlebars', function(c)
	-- buttons for the titlebar
	local buttons = gears.table.join(
		awful.button({ }, 1, function()
			awful.mouse.client.move(c)
		end),
		awful.button({ }, 3, function()
			awful.mouse.client.resize(c)
		end)
	)

	for _, side in ipairs {'top', 'right', 'left', 'bottom'} do
		awful.titlebar(c, {
			size = dpi(8),
			position = side,
			bg = beautiful.bg_light,
		}):setup {
			layout = wibox.layout.fixed.horizontal,
			buttons = buttons,
		}
	end
end)

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
	-- Wallpaper
	if beautiful.wallpaper then
		local wallpaper = beautiful.wallpaper
		-- If wallpaper is a function, call it with the screen
		if type(wallpaper) == "function" then
			wallpaper = wallpaper(s)
		end
		gears.wallpaper.maximized(wallpaper, s, true)
	end
end)

client.connect_signal("manage", function(c)
	c.shape = function(cr,w,h)
		gears.shape.rounded_rect(cr,w,h,3)
	end
end)
-- }}}

-- init theme {{{
beautiful.init(string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme))

-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s)
	beautiful.at_screen_connect(s)
end)
-- }}}
