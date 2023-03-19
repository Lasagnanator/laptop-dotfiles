---@diagnostic disable: unused-local
--<< AwesomeWM modules
local awful   = require("awful")
local naughty = require("naughty")

--<< Personal Modules
local global = require("modules.global")

--<< Bling
local bling = require("bling")

--<< Vars
local modkey   = global.modkey
local terminal = global.terminal

--<< Get current screen geometry
local function get_x ()
    local screen = awful.screen.focused()
    local x = screen.width / 8
    return tostring(x)
end

local function get_y ()
    local screen = awful.screen.focused()
    local y = screen.height / 8
    return tostring(y)
end

local function get_height ()
    local screen = awful.screen.focused()
    local height = ( screen.height / 8 ) * 6
    return tostring(height)
end

local function get_width ()
    local screen = awful.screen.focused()
    local width = ( screen.width / 8 ) * 6
    return tostring(width)
end

--<< Scratchpads
local term_scratch = bling.module.scratchpad {
    command   = terminal .. " --class spad",   -- How to spawn the scratchpad
    rule      = { instance = "spad" },         -- The rule that the scratchpad will be searched by
    sticky    = true,                          -- Whether the scratchpad should be sticky
    autoclose = true,                          -- Whether it should hide itself when losing focus
    floating  = true,                          -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
    geometry  = {                              -- The geometry in a floating state
        -- x      = scratchpads_parameters.x,
        -- y      = scratchpads_parameters.y,
        -- height = scratchpads_parameters.height,
        -- width  = scratchpads_parameters.width,
        x      = 240,
        y      = 135,
        height = 810,
        width  = 1440,
    },
    reapply   = true,                          -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
    dont_focus_before_close  = false,          -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
}

--<< Keymaps
awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, "n", function() term_scratch:toggle() end,
              {description="launch terminal scratchpad", group="launcher"}),
})

-- awful.keyboard.append_global_keybindings({
--     awful.key({ modkey }, "n", function()
--         naughty.notification {
--             title = "Dimension test",
--             message = "x = " .. get_x .. "\n" ..
--                       "y = " .. get_y .. "\n" ..
--                       "height = " .. get_height .. "\n" ..
--                       "width = " .. get_width,
--         }
--     end,
--               {description="launch terminal scratchpad", group="launcher"}),
-- })
