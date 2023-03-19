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
-- local autostart_script = gears.filesystem.get_configuration_dir() .. 'autostart.sh'
-- awful.spawn.once(autostart_script)

local autostart = {
    "udiskie",
    "easyeffects --gapplication-service",
    "picom --experimental-backends",
    "xss-lock " .. os.getenv("HOME") .. "/.scripts/lockscreen",
}

for _, cmd in pairs(autostart) do
    awful.spawn.once(cmd)
end

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

