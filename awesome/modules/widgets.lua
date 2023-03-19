-- AwesomeWM modules
local lain = require('lain')
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local naughty = require("naughty")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")

--<< Personal modules
local global = require("modules.global")
local colors = require("themes." .. global.theme .. "/colors")

--<< Variables
local current_theme = global.theme_path
local dpi = xresources.apply_dpi

--<< Personal modules
-- local global = require('modules.global')

local w = {}

w.left_powerline = function (arrow_color, adjacent_color, height)
    local box = wibox.container.background()
    local layout = wibox.layout.fixed.horizontal()
    local separator = wibox.widget.textbox()
    separator.text = ""
    separator.font = "iosevka " .. height
    separator.valign = "center"
    layout:add(separator)
    box.bg = adjacent_color
    box.fg = arrow_color
    box:set_widget(layout)
    return box
end

w.right_powerline = function (arrow_color, adjacent_color, height)
    local box = wibox.container.background()
    local layout = wibox.layout.fixed.horizontal()
    local separator = wibox.widget.textbox()
    separator.text = ""
    separator.font = "iosevka " .. height
    separator.valign = "center"
    layout:add(separator)
    box.bg = adjacent_color
    box.fg = arrow_color
    box:set_widget(layout)
    return box
end

w.left_slope = function (slope_color, adjacent_color, height)
    local box = wibox.container.background()
    local layout = wibox.layout.fixed.horizontal()
    local separator = wibox.widget.textbox()
    separator.text = ""
    separator.font = "iosevka " .. height
    separator.valign = "center"
    layout:add(separator)
    box.bg = adjacent_color
    box.fg = slope_color
    box:set_widget(layout)
    return box
end

w.right_slope = function (slope_color, adjacent_color, height)
    local box = wibox.container.background()
    local layout = wibox.layout.fixed.horizontal()
    local separator = wibox.widget.textbox()
    separator.text = ""
    separator.font = "iosevka " .. height
    separator.valign = "center"
    layout:add(separator)
    box.bg = adjacent_color
    box.fg = slope_color
    box:set_widget(layout)
    return box
end

w.cpu = function (bg_color, text_color, icon_color)
    -- Text
    local cpu = lain.widget.cpu {
        timeout = 1,
        settings = function ()
            ---@diagnostic disable-next-line: undefined-global
            widget:set_markup(cpu_now.usage .. '%' or 'N/A')
        end
    }
    cpu.valign = 'center'
    cpu.halign = 'right'
    cpu.forced_width = 30
    -- Icon
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/cpu.png')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 15
    icon.valign = 'center'
    icon.halign = 'center'
    -- Layout
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(cpu)
    -- Container
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal
    return box
end

w.mem = function (bg_color, text_color, icon_color)
    -- Text
    local ram = lain.widget.mem {
        timeout = 1,
        settings = function ()
            ---@diagnostic disable-next-line: undefined-global
            widget:set_markup(mem_now.perc .. '%' or 'N/A')
        end
    }
    ram.valign = 'center'
    ram.halign = 'right'
    ram.forced_width = 30
    -- Icon
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/ram.svg')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 30
    icon.valign = 'center'
    icon.halign = 'center'
    -- Layout
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(ram)
    -- Container
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal
    return box
end

w.temp = function (bg_color, text_color, icon_color)
    -- Text
    local temp = lain.widget.temp {
        timeout = 1,
        settings = function ()
            ---@diagnostic disable-next-line: undefined-global
            widget:set_markup(coretemp_now .. '°C' or 'N/A')
        end
    }
    temp.valign = 'center'
    temp.halign = 'right'
    temp.forced_width = 45
    -- Icon
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/thermometer.png')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 20
    icon.valign = 'center'
    icon.halign = 'center'
    -- Layout
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(temp)
    -- Container
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal
    return box
end

w.bat = function (bg_color, text_color, icon_color)
    -- Text 1
    local bat1 = lain.widget.bat {
        timeout = 1,
        battery = 'BAT0',
        ac = 'AC',
        notify = 'off',
        settings = function ()
            ---@diagnostic disable-next-line: undefined-global
            widget:set_markup(bat_now.n_perc[1] .. '%')
        end,
    }
    bat1.valign = 'center'
    bat1.halign = 'right'
    bat1.forced_width = 35
    -- Text
    local bat2 = lain.widget.bat {
        timeout = 1,
        battery = 'BAT1',
        ac = 'AC',
        notify = 'off',
        settings = function ()
            ---@diagnostic disable-next-line: undefined-global
            widget:set_markup(bat_now.n_perc[1] .. '%' or 'N/A')
        end,
    }
    bat2.valign = 'center'
    bat2.halign = 'right'
    bat2.forced_width = 35
    -- Icon
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/bat-lighting.png')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 20
    icon.valign = 'center'
    icon.halign = 'center'
    -- Layout
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(bat1)
    layout:add(bat2)
    -- Container
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal
    return box
end

w.volume = function (bg_color, text_color, icon_color)

    -- Text
    local text = wibox.widget.textbox()
    text.valign = 'center'
    text.halign = 'right'
    text.forced_width = 50
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/bat-charging.png')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 20
    icon.valign = 'center'
    icon.halign = 'center'

    -- Layout
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(text)

    -- Container
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal

    -- Functions
    local update_script_path = gears.filesystem.get_configuration_dir() .. 'modules/scripts/vol.sh'

    local function get_volume()
        awful.spawn.easy_async_with_shell(update_script_path, function (stdout)
            text:set_markup(stdout)
        end)
    end

    local function update_volume(action, quantity)
        if action == 'inc' then
            awful.spawn.easy_async_with_shell('pamixer -i ' .. quantity .. '; ' .. update_script_path, function (stdout)
                text:set_markup(stdout)
            end)
        elseif action == 'dec' then
            awful.spawn.easy_async_with_shell('pamixer -d ' .. quantity .. '; ' .. update_script_path, function (stdout)
                text:set_markup(stdout)
            end)
        elseif action == 'mute' then
            awful.spawn.easy_async_with_shell('pamixer -t; ' .. update_script_path, function (stdout)
                text:set_markup(stdout)
            end)
        else
            naughty.notification {
                title = 'You fucked up bro',
                message = 'Incorrect argument given in configuration, accepted parameters are "inc", "dec", and "mute"',
            }
        end
    end

    -- Timer
    local restart = gears.timer({
        timeout = 5,
        autostart = true,
        call_now = true,
        callback = get_volume
    })

    -- Signals
    awesome.connect_signal('volume_increase', function ()
        update_volume('inc', 1)
        restart:again()
    end)

    awesome.connect_signal('volume_decrease', function ()
        update_volume('dec', 1)
        restart:again()
    end)

    awesome.connect_signal('mute_change', function ()
        update_volume('mute')
        restart:again()
    end)

    return box
end

w.volume_keybind = function (bg_color, text_color, icon_color)

    -- Text
    local text = wibox.widget.textbox()
    text.valign = 'center'
    text.halign = 'right'
    text.forced_width = 50
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/bat-charging.png')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 20
    icon.valign = 'center'
    icon.halign = 'center'

    -- Layout
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(text)

    -- Container
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal

    -- Functions
    local update_script_path = gears.filesystem.get_configuration_dir() .. 'modules/scripts/vol.sh'

    local function get_volume()
        awful.spawn.easy_async_with_shell(update_script_path, function (stdout)
            text:set_markup(stdout)
        end)
    end

    -- Timer
    local set_volume = gears.timer({
        timeout = 5,
        autostart = true,
        call_now = true,
        callback = get_volume
    })

    -- Signals
    awesome.connect_signal('volume', function (stdout)
        text:set_markup(stdout)
        set_volume:again()
    end)

    return box
end

w.brightness = function (bg_color, text_color, icon_color)

    -- Text
    local text = wibox.widget.textbox()
    text.valign = 'center'
    text.halign = 'right'
    text.forced_width = 50
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/bat-charging.png')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 20
    icon.valign = 'center'
    icon.halign = 'center'

    -- Layout
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(text)

    -- Container
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal

    -- Functions
    local function get_backlight()
        awful.spawn.easy_async('xbacklight', function (stdout)
            local value = math.floor(stdout + 0.5)
            text:set_text(value or 'N/A')
        end)
    end

    local function update_backlight(action, quantity)
        awful.spawn.easy_async_with_shell('xbacklight -' .. action .. ' ' .. quantity .. '; xbacklight', function (stdout)
            text:set_text(math.floor(stdout + 0.5))
        end)
    end

    -- Timer
    local restart = gears.timer({
        timeout = 5,
        autostart = true,
        call_now = true,
        callback = get_backlight
    })

    -- Signals
    awesome.connect_signal('brightness_increase', function () update_backlight('inc', 1)
        restart:again()
    end)

    awesome.connect_signal('brightness_decrease', function ()
        update_backlight('dec', 1)
        restart:again()
    end)

    return box
end

w.brightness_keymap = function (bg_color, text_color, icon_color)

    -- Text
    local text = wibox.widget.textbox()
    text.valign = 'center'
    text.halign = 'right'
    text.forced_width = 50
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/bat-charging.png')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 20
    icon.valign = 'center'
    icon.halign = 'center'

    -- Layout
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(text)

    -- Container
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal

    -- Functions
    local function get_backlight()
        awful.spawn.easy_async('xbacklight', function (stdout)
            local value = math.floor(stdout + 0.5)
            text:set_text(value or 'N/A')
        end)
    end

    -- Timer
    local set_brightness = gears.timer({
        timeout = 5,
        autostart = true,
        call_now = true,
        callback = get_backlight
    })

    -- Signals
    awesome.connect_signal('brightness', function (stdout)
        text:set_text(stdout)
        set_brightness:again()
    end)

    return box
end

w.debug = function (label, output)
    local box = wibox.container.background()
    local layout = wibox.layout.fixed.horizontal()
    local text = wibox.widget.textbox(label)
    layout:add(text)
    box:set_widget(layout)
    box:buttons(gears.table.join(
        awful.button({}, 1, function ()
            naughty.notification {
                title = "Debug notification",
                message = output,
            }
        end)
    ))
    return box
end

w.debug_shell = function (label, command)
    local box = wibox.container.background()
    local layout = wibox.layout.fixed.horizontal()
    local text = wibox.widget.textbox(label)
    layout:add(text)
    box:set_widget(layout)
    box:buttons(gears.table.join(
        awful.button({}, 1, function ()
            awful.spawn.easy_async_with_shell(command, function (stdout)
                naughty.notification {
                    title = "Debug a shell command",
                    message = stdout,
                }
            end)
        end)
    ))
    return box
end

w.dot_shape_test = function ()
    local image = wibox.widget.imagebox()
    image.image = gears.surface.load_from_shape(10, 10, gears.shape.circle, colors.orange )
    image.resize = false
    local margins = wibox.container.margin()
    margins:set_widget(image)
    margins.left = dpi(2)
    margins.right = dpi(2)
    margins.top = dpi(1)
    margins.bottom = dpi(1)
    local box = wibox.container.background()
    box.forced_width = 20
    box:set_widget(margins)
    return box
end

return w
