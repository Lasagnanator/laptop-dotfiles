--<< AwesomeWM modules
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")

--<< Personal modules
local taglist = require("modules.taglist")
local global = require("modules.global")
local colors = require("themes." .. global.theme .. "/colors")
local widgets = require("modules.widgets")

--<< Bling
local bling = require("bling")

--<< Theme definition
local theme_path = global.theme_path .. "theme.lua"
beautiful.init(theme_path)

--<< Tag layout
-- Table of layouts to cover with awful.layout.inc, order matters.
---@diagnostic disable-next-line: undefined-global
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
--      awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
--      awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
--      awful.layout.suit.spiral,
--      awful.layout.suit.spiral.dwindle,
        bling.layout.mstab,
        bling.layout.centered,
--      bling.layout.vertical,
--      bling.layout.horizontal,
--      bling.layout.equalarea,
--      bling.layout.deck,
        awful.layout.suit.max,
--      awful.layout.suit.max.fullscreen,
--      awful.layout.suit.magnifier,
--      awful.layout.suit.corner.nw,
        awful.layout.suit.floating,
    })
end)

--<< Wibar
-- Keyboard map indicator and switcher
---@diagnostic disable-next-line: unused-local
local mykeyboardlayout = awful.widget.keyboardlayout()

-- Create a textclock widget
local mytextclock = wibox.widget.textclock()

--Separators
-- local lsep = widgets.left_slope
-- local rsep = widgets.right_slope

screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()

    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end),
            awful.button({ }, 4, function () awful.layout.inc(-1) end),
            awful.button({ }, 5, function () awful.layout.inc( 1) end),
        }
    }

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button({ }, 1, function(t) t:view_only() end),
            awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
            -- awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            -- awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = {
            awful.button({ }, 1, function (c)
                c:activate { context = "tasklist", action = "toggle_minimization" }
            end),
            awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
            awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
            awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
        }
    }

    -- Create the wibox
    s.mywibox = awful.wibar {
        position = "top",
        height   = 25,
        screen   = s,
        widget   = {
            layout = wibox.layout.align.horizontal,
            expand = "none",
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                s.mylayoutbox,
                -- lsep(colors.orange, colors.purple, 24),
                widgets.debug("DEBUG", gears.filesystem.get_configuration_dir() .. 'modules/scripts/vol.sh'),
                wibox.widget.textbox("  "),
                widgets.debug_shell("SHELL", "pamixer --get-mute"),
                -- lsep(colors.orange, colors.purple, 24),
            },
            { -- Middle widget)
                layout = wibox.layout.align.horizontal,
                -- expand = "none",
                taglist(s),
                -- s.mytaglist,
                -- s.mytasklist,
            },
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                -- mykeyboardlayout,
                -- rsep(colors.orange, colors.purple, 24),
                wibox.widget.systray(),
                wibox.widget.textbox("  "),
                widgets.brightness_keymap(beautiful.bg_normal, colors.orange, '#656EA6'),
                wibox.widget.textbox("  "),
                -- rsep(colors.orange, colors.purple, 24),
                widgets.volume_keybind(beautiful.bg_normal, colors.orange, '#656EA6'),
                wibox.widget.textbox("  "),
                widgets.mem(beautiful.bg_normal, colors.orange, '#656EA6'),
                -- rsep(colors.orange, colors.purple, 24),
                wibox.widget.textbox("  "),
                widgets.cpu(beautiful.bg_normal, colors.orange, '#656EA6'),
                wibox.widget.textbox("  "),
                -- widgets.cpu_stack_test(beautiful.bg_normal, colors.orange, '#484F75'),
                -- rsep(colors.orange, colors.purple, 24),
                widgets.temp(beautiful.bg_normal, colors.orange, '#656EA6'),
                wibox.widget.textbox("  "),
                -- rsep(colors.orange, colors.purple, 24),
                widgets.bat(beautiful.bg_normal, colors.orange, '#656EA6'),
                -- rsep(colors.orange, colors.purple, 24),
                mytextclock,
            },
        }
    }
end)
