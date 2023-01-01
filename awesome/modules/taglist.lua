--<< THIS BITCH MUST CHANGE THE ICONS BRUH

--<< AwesomeWM modules
local awful = require("awful")
local gears = require("gears")
-- local gfs = gears.filesystem
local wibox = require("wibox")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

--<< Personal modules
local global = require("modules.global")
local current_theme = global.theme_path
local colors = require("themes." .. global.theme .. "/colors")

local taglist = function (s)

    --<< Icons
    local pacman = gears.surface.load_uncached(current_theme .. "icons/focus.svg")
    local ghost = gears.surface.load_uncached(current_theme .. "icons/occupied.svg")
    local dot = gears.surface.load_from_shape(10, 10, gears.shape.circle, colors.gray )
    local focus_icon = gears.color.recolor_image(pacman, colors.orange)
    local occupied_icon = gears.color.recolor_image(ghost, colors.purple)

    --<< Update the tags
    local update_tags = function (self, tag)
        local tagicon = self:get_children_by_id("icon_role")[1]
        local margins = self:get_children_by_id("margin_role")[1]
        if tag.selected then
            tagicon.image = focus_icon
            margins.top = 3
            margins.bottom = 3
            margins.left = 3
            margins.right = 3
        elseif #tag:clients() == 0 then
            tagicon.image = dot
            margins.top = 10
            margins.bottom = 10
            margins.left = 10
            margins.right = 10
        else
            tagicon.image = occupied_icon
            margins.top = 2
            margins.bottom = 2
            margins.left = 2
            margins.right = 2
        end
    end

    --<< Define the buttons
    local buttons = gears.table.join ({
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
    })

    --<< Make the taglist
    local icon_taglist = awful.widget.taglist {
        screen = s,
        filter = awful.widget.taglist.filter.all,
        layout = {
            spacing = 0,
            -- max_widget_size = 100,
            layout = wibox.layout.fixed.horizontal
        },
        widget_template = {
            {
                {
                    id = "icon_role",
                    widget = wibox.widget.imagebox
                },
                id = "margin_role",
                -- top = 3,
                -- bottom = 3,
                -- left = 2,
                -- right = 2,
                widget = wibox.container.margin
            },
            id = "background_role",
            widget = wibox.container.background,
---@diagnostic disable-next-line: unused-local
            create_callback = function(self, tag, index, objects)
                update_tags(self, tag)
            end,

---@diagnostic disable-next-line: unused-local
            update_callback = function(self, tag, index, objects)
                update_tags(self, tag)
            end
        },
        buttons = buttons
    }
    return icon_taglist

end

return taglist
