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

w.debug = function (label, output)
    local box = wibox.container.background()
    local layout = wibox.layout.fixed.horizontal()
    local text = wibox.widget.textbox(label)
    layout:add(text)
    box:set_widget(layout)
    box:buttons(gears.table.join(
        awful.button({}, 1, function ()
            naughty.notify {
                title = "Debug notification",
                text = output,
            }
        end)
    ))
    return box
end

w.dot = function ()
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
    local cpu = lain.widget.cpu {
        timeout = 1,
        settings = function ()
            ---@diagnostic disable-next-line: undefined-global
            widget:set_markup( ' ' .. cpu_now.usage .. '%' )
        end
    }
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/cpu.png')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 15
    icon.valign = 'center'
    icon.halign = 'center'
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(cpu)
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal
    return box
end

w.mem = lain.widget.mem {
    timeout = 1,
    settings = function ()
---@diagnostic disable-next-line: undefined-global
        widget:set_markup( 'RAM ' .. mem_now.perc .. '%' )
        widget:set_font(beautiful.font)
    end
}

w.temp = lain.widget.temp {
    timeout = 1,
    settings = function ()
---@diagnostic disable-next-line: undefined-global
        widget:set_markup( coretemp_now .. '°C' )
        widget:set_font(beautiful.font)
    end
}

w.bat = lain.widget.bat {
    timeout = 1,
    batteries = { 'BAT0', 'BAT1' },
    ac = 'AC',
    settings = function ()
---@diagnostic disable-next-line: undefined-global
        widget:set_markup( 'BAT 1: ' .. bat_now.n_perc[1] .. '% / 2: ' .. bat_now.n_perc[2] .. '%' )
        widget:set_font(beautiful.font)
    end,
}

return w
