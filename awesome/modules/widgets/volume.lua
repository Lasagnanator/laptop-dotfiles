--<< VOLUME WIDGETS >>--
    -- Text
    local vol = wibox.widget.textbox()
    vol.valign = 'center'
    vol.halign = 'right'
    vol.forced_width = 25
    local function update_volume()
        if (awful.spawn('pamixer --get-mute')) then
            vol:set_markup('MUTE')
        else
            vol:set_markup(awful.spawn('pamixer --get-volume'))
        end
    end
    gears.timer({
        timeout = 10,
        call_now = true,
        autostart = true,
        callback = update_volume()
    })
    awesome.connect_signal('volume_change', update_volume)
    -- Icon
    local icon = wibox.widget.imagebox()
    local surface = gears.surface.load_uncached(current_theme .. 'icons/bat-charging.png')
    icon.image = gears.color.recolor_image(surface, icon_color or beautiful.fg_normal)
    icon.forced_width = 20
    icon.valign = 'center'
    icon.halign = 'center'
    -- Layout
    local layout = wibox.layout.fixed.horizontal()
    layout:add(icon)
    layout:add(vol)
    -- Container
    local box = wibox.container.background()
    box:set_widget(layout)
    box.bg = bg_color or beautiful.bg_normal
    box.fg = text_color or beautiful.fg_normal
