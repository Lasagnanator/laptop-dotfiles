--------------
-- Keybinds --
--------------

-- Standard awesome library
local awful         = require("awful")
-- Notification library
local naughty       = require("naughty")
-- Declarative object management
local hotkeys_popup = require("awful.hotkeys_popup")
-- Bling
local bling         = require("bling")

-- Variables
local global = require("configs.global")
modkey       = global.modkey
terminal     = global.terminal
browser      = global.browser
editor       = global.editor
launcher     = global.launcher
explorer     = global.explorer
editor_cmd   = global.editor_cmd
explorer_cmd = global.explorer_cmd

-- General keybinds
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Mod1"    }, "s",      hotkeys_popup.show_help,
              { description="show help",           group = "awesome" }),
    awful.key({ modkey, "Control" }, "r",      awesome.restart,
              { description = "reload awesome",    group = "awesome" }),
    awful.key({ modkey, "Control", "Shift" }, "q",      awesome.quit,
              { description = "quit awesome",      group = "awesome" }),
    awful.key({ modkey,           }, "Return", function() awful.spawn(terminal) end,
              { description = "open a terminal",   group = "launcher" }),
    awful.key({ modkey,           }, "w",      function() awful.spawn(browser)  end,
              { description = "open the browser",  group = "launcher" }),
    awful.key({ modkey            }, "p",      function() awful.spawn(launcher)     end,
              { description = "show app launcher", group = "launcher" }),
})

-- Tags related keybinds
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "h",      awful.tag.viewprev,
              { description = "view previous", group = "tag" }),
    awful.key({ modkey,           }, "l",      awful.tag.viewnext,
              { description = "view next",     group = "tag" }),
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, "Control" },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers = { modkey, "Mod1" },
        keygroup    = "numrow",
        description = "swap clients between tags",
        group       = "tag",
        on_press    = function(index)
            local screen = awful.screen.focused()
            local tag = screen.selected_tag
            local tag2 = screen.tags[index]
            local orig_tag2_clients = tag2:clients()
            if tag then
                for _,c in ipairs(tag:clients()) do
                    c:move_to_tag(tag2)
                end
                for _,c in ipairs(orig_tag2_clients) do
                    c:move_to_tag(tag)
                end
            end
        end
    },
    awful.key {
        modifiers   = { modkey, "Control", "Shift" },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
})

-- Focus related keybinds
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "Down",  function() awful.client.focus.bydirection("down")  end,
              { description = "focus down",                group = "client" }),
    awful.key({ modkey,           }, "Up",    function() awful.client.focus.bydirection("up")    end,
              { description = "focus up",                  group = "client" }),
    awful.key({ modkey,           }, "Left",  function() awful.client.focus.bydirection("left")  end,
              { description = "focus right",               group = "client" }),
    awful.key({ modkey,           }, "j",     function() awful.client.focus.byidx( 1)            end,
              { description = "focus next by index",       group = "client" }),
    awful.key({ modkey,           }, "k",     function() awful.client.focus.byidx(-1)            end,
              { description = "focus previous by index",   group = "client" }),
    awful.key({ modkey,           }, "0",     awful.client.urgent.jumpto,
              { description = "jump to urgent client",     group = "client" }),
    awful.key({ modkey,           }, "]",     function() awful.screen.focus_relative( 1)         end,
              { description = "focus the next screen",     group = "screen" }),
    awful.key({ modkey,           }, "[",     function() awful.screen.focus_relative(-1)         end,
              { description = "focus the previous screen", group = "screen" }),
})

-- Layout related keybinds
awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Mod1"    }, "j", function() awful.client.swap.byidx(  1)        end,
              { description = "swap with next client by index",        group = "client" }),
    awful.key({ modkey, "Mod1"    }, "k", function() awful.client.swap.byidx( -1)        end,
              { description = "swap with previous client by index",    group = "client" }),
    awful.key({ modkey, "Control" }, "j", function() awful.client.incwfact(-0.05)        end,
              { description = "decrease client height factor",         group = "client" }),
    awful.key({ modkey, "Control" }, "k", function() awful.client.incwfact( 0.05)        end,
              { description = "increase client height factor",         group = "client" }),
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incmwfact(-0.05)          end,
              { description = "decrease master width factor",          group = "layout functions" }),
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incmwfact( 0.05)          end,
              { description = "increase master width factor",          group = "layout functions" }),
    awful.key({ modkey, "Mod1"    }, "h", function() awful.tag.incnmaster( 1, nil, true) end,
              { description = "increase the number of master clients", group = "layout functions" }),
    awful.key({ modkey, "Mod1"    }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
              { description = "decrease the number of master clients", group = "layout functions" }),
    awful.key({ modkey, "Shift"   }, "h", function() awful.tag.incncol(-1, nil, true)    end,
              { description = "increase the number of columns",        group = "layout functions" }),
    awful.key({ modkey, "Shift"   }, "l", function() awful.tag.incncol( 1, nil, true)    end,
              { description = "decrease the number of columns",        group = "layout functions" }),
    awful.key({ modkey,           }, "r", function()
        local tag = awful.screen.focused().selected_tag
        tag.master_width_factor = 0.5
        tag.master_count = 1
    end,
              { description = "reset the layout status",               group = "layout functions" }),
})

-- Layout selection
awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "s", function() awful.layout.set(awful.layout.suit.tile)            end,
              { description = "tile",            group = "layout" }),
    awful.key({ modkey, "Control" }, "s", function() awful.layout.set(awful.layout.suit.tile.bottom)     end,
              { description = "tile bottom",     group = "layout" }),
    awful.key({ modkey,           }, "g", function() awful.layout.set(awful.layout.suit.fair)            end,
              { description = "fair",            group = "layout" }),
    awful.key({ modkey, "Control" }, "g", function() awful.layout.set(awful.layout.suit.fair.horizontal) end,
              { description = "fair horizontal", group = "layout" }),
    awful.key({ modkey, "Control" }, "d", function() awful.layout.set(bling.layout.mstab)                end,
              { description = "tabs (?)",        group = "layout" }),
    awful.key({ modkey,           }, "d", function() awful.layout.set(bling.layout.centered)             end,
              { description = "centered master", group = "layout" }),
    awful.key({ modkey,           }, "m", function() awful.layout.set(awful.layout.suit.max)             end,
              { description = "monocle",         group = "layout" }),
    awful.key({ modkey, "Shift"   }, "f", function() awful.layout.set(awful.layout.suit.floating)        end,
              { description = "floating",        group = "layout" }),
})

-- Media keys binds
awful.keyboard.append_global_keybindings({
    awful.key({}, "XF86AudioRaiseVolume",  function() awful.spawn.with_shell("raise-volume")                               end,
              { description="raise volume",       group="media" }),
    awful.key({}, "XF86AudioLowerVolume",  function() awful.spawn.with_shell("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-")  end,
              { description="lower volume",       group="media" }),
    awful.key({}, "XF86AudioMute",         function() awful.spawn.with_shell("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle") end,
              { description="mute audio",         group="media" }),
    awful.key({}, "XF86MonBrightnessUp",   function() awful.spawn.with_shell("xbacklight -inc 1")                          end,
              { description="increase backlight", group="media" }),
    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn.with_shell("xbacklight -dec 1")                          end,
              { description="decrease backlight", group="media" }),
    awful.key({}, "XF86AudioPlay",         function() awful.spawn.with_shell("playerctl play-pause")                       end,
              { description="play/pause",         group="media" }),
    awful.key({}, "XF86AudioNext",         function() awful.spawn.with_shell("playerctl next")                             end,
              { description="next track",         group="media" }),
    awful.key({}, "XF86AudioPrev",         function() awful.spawn.with_shell("playerctl previous")                         end,
              { description="previous track",     group="media" }),
})

-- Client keybinds
client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key({ modkey,           }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
                  { description = "toggle fullscreen",         group = "client" }),
        awful.key({ modkey, "Shift"   }, "q",
            function()
                tag = awful.screen.focused().selected_tag
                for _,c in ipairs(tag:clients()) do
                    c:kill()
                end
            end,
                  { description = "close all clients in tag",  group = "client" }),
        awful.key({ modkey, "Control" }, "q",
            function()
                tag = awful.screen.focused().selected_tag
                for _,c in ipairs(tag:clients()) do
                    if c == client.focus then goto focused end
                    c:kill()
                    ::focused::
                end
            end,
                  { description = "close all other clients",   group = "client" }),
        awful.key({ modkey,           }, "q",     function(c) c:kill()                               end,
                  { description = "close",                     group = "client" }),
        awful.key({ modkey, "Control" }, "f",     awful.client.floating.toggle,
                  { description = "toggle floating",           group = "client" }),
        awful.key({ modkey,           }, "space", function() client.focus = awful.client.getmaster() end,
                  { description = "select master",             group = "client" }),
        awful.key({ modkey, "Mod1"    }, "space", function(c) awful.client.setmaster(c)              end,
                  { description = "move to master",            group = "client" }),
        awful.key({ modkey, "Control" }, "]",     function(c) c:move_to_screen( c.screen.index + 1 ) end,
                  { description = "move to screen",            group = "client" }),
        awful.key({ modkey, "Control" }, "[",     function(c) c:move_to_screen( c.screen.index - 1 ) end,
                  { description = "move to screen",            group = "client" }),
        awful.key({ modkey,           }, "t",     function(c) c.ontop = not c.ontop                  end,
                  { description = "toggle keep on top",        group = "client" }),
        awful.key({ modkey,           }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end,
                  { description = "(un)maximize",              group = "client" }),
    })
end)



----<< EXTRA >>----

-- Test for resetting the window factor:
-- count = 0
-- for _ in pairs(tag:clients()) do count = count + 1 end
-- fact = 1 / (count - 1)
-- if ( count < 2 ) then
--     naughty.notify{
--         title = "Warning",
--         text  = "Didn't reset wfact since there aren't enough windows",
--     }
--     goto exit
-- end 
-- prior_wfact = tag.windowfact[1][2]
-- naughty.notify{
--     title = "Debug",
--     text  = "Starting wfact: " .. prior_wfact
-- }
-- naughty.notify{
--     title = "Debug",
--     text  = "Count: " .. count .. "\nFact: " .. fact,
-- }
-- for _,c  in ipairs(tag:clients()) do
--     awful.client.setwfact(fact, c)
-- end
-- ::exit::
