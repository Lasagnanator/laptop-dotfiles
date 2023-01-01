--<< AWESOME WM CONFIGURATION >>--

-- awesome_mode: api-level=4:screen=on

--<< Luarocks call
pcall(require, "luarocks.loader")

--<< Awesome's libraries
-- Standard awesome library
local awful = require("awful")
                      require("awful.autofocus") -- [needed?]
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
                      require("awful.hotkeys_popup.keys")
-- Error handling
                      require("modules.error")
local gears = require("gears")

--<< Modules
-- local widgets = require("modules.widgets")
require("modules.bar")
-- require("modules.rules")

--<< Variables
local global = require("modules.global")

--<< Theme definition
local theme_path = global.theme_path .. "theme.lua"
beautiful.init(theme_path)

--<< Autostart
-- local autostart = {
--     'udiskie',
--     'easyeffects --gapplication-service',
--     'picom --experimental-backend',
-- }
--
-- for _, cmd in pairs(autostart) do
--     awful.spawn.once(cmd)
-- end

local autostart_script = gears.filesystem.get_configuration_dir() .. 'autostart.sh'
awful.spawn.once(autostart_script)


--<< Bling
-- local bling = require("bling")
-- bling.module.window_swallowing.start()
require("modules.scratchpads")

--<< Wallpaper
screen.connect_signal("request::wallpaper", function(s)
    awful.wallpaper {
        screen = s,
        widget = {
            {
                image     = beautiful.wallpaper,
                upscale   = true,
                downscale = true,
                widget    = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
            tiled  = false,
            widget = wibox.container.tile,
        }
    }
end)

--<< Keybinds and buttons
require("modules.keybindings")
require("modules.buttons")

-- --<< Wibar
-- -- Keyboard map indicator and switcher
-- ---@diagnostic disable-next-line: unused-local
-- local mykeyboardlayout = awful.widget.keyboardlayout()
--
-- -- Create a textclock widget
-- local mytextclock = wibox.widget.textclock()
--
-- screen.connect_signal("request::desktop_decoration", function(s)
--     -- Each screen has its own tag table.
--     awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
--
--     -- Create a promptbox for each screen
--     s.mypromptbox = awful.widget.prompt()
--
--     -- Create an imagebox widget which will contain an icon indicating which layout we're using.
--     -- We need one layoutbox per screen.
--     s.mylayoutbox = awful.widget.layoutbox {
--         screen  = s,
--         buttons = {
--             awful.button({ }, 1, function () awful.layout.inc( 1) end),
--             awful.button({ }, 3, function () awful.layout.inc(-1) end),
--             awful.button({ }, 4, function () awful.layout.inc(-1) end),
--             awful.button({ }, 5, function () awful.layout.inc( 1) end),
--         }
--     }
--
--     -- Create a taglist widget
--     s.mytaglist = awful.widget.taglist {
--         screen  = s,
--         filter  = awful.widget.taglist.filter.all,
--         buttons = {
--             awful.button({ }, 1, function(t) t:view_only() end),
--             awful.button({ modkey }, 1, function(t)
--                 if client.focus then
--                     client.focus:move_to_tag(t)
--                 end
--             end),
--             awful.button({ }, 3, awful.tag.viewtoggle),
--             awful.button({ modkey }, 3, function(t)
--                 if client.focus then
--                     client.focus:toggle_tag(t)
--                 end
--             end),
--             -- awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
--             -- awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
--         }
--     }
--
--     -- Custom taglist
--     s.mytaglist = awful.widget.taglist {
--         screen  = s,
--         filter  = awful.widget.taglist.filter.all,
--         buttons = {
--             awful.button({ }, 1, function(t) t:view_only() end),
--             awful.button({ modkey }, 1, function(t)
--                                             if client.focus then
--                                                 client.focus:move_to_tag(t)
--                                             end
--                                         end),
--             awful.button({ }, 3, awful.tag.viewtoggle),
--             awful.button({ modkey }, 3, function(t)
--                                             if client.focus then
--                                                 client.focus:toggle_tag(t)
--                                             end
--                                         end),
--             -- awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
--             -- awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
--         }
--     }
--
--     -- Create a tasklist widget
--     s.mytasklist = awful.widget.tasklist {
--         screen  = s,
--         filter  = awful.widget.tasklist.filter.currenttags,
--         buttons = {
--             awful.button({ }, 1, function (c)
--                 c:activate { context = "tasklist", action = "toggle_minimization" }
--             end),
--             awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
--             awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
--             awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
--         }
--     }
--
--     -- Create the wibox
--     s.mywibox = awful.wibar {
--         position = "top",
--         screen   = s,
--         widget   = {
--             layout = wibox.layout.align.horizontal,
--             expand = "none",
--             { -- Left widgets
--                 layout = wibox.layout.fixed.horizontal,
--                 s.mylayoutbox,
--                 mylauncher,
--                 s.mypromptbox,
--             },
--             { -- Middle widget
--                 layout = wibox.layout.align.horizontal,
--                 -- expand = "none",
--                 s.mytaglist,
--                 -- s.mytasklist,
--             },
--             { -- Right widgets
--                 layout = wibox.layout.fixed.horizontal,
--                 -- mykeyboardlayout,
--                 wibox.widget.systray(),
--                 widgets.mem,
--                 widgets.cpu,
--                 widgets.temp,
--                 widgets.bat,
--                 mytextclock,
--             },
--         }
--     }
-- end)
--
--<< Client management
client.connect_signal("manage", function(c)
     if not awesome.startup then awful.client.setslave(c) end
end)

--<< Rules
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }
end)

--<< Notifications
ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--    c:activate { context = "mouse_enter", raise = false }
--end)
