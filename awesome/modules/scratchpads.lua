-- Standard awesome library
local awful         = require("awful")

-- {{{ Organized modules for cleaner code
local global = require("modules.global")

local bling  = require("bling")

-- {{{ Variables
local modkey       = global.modkey
local terminal     = global.terminal

local term_scratch = bling.module.scratchpad {
    command   = terminal .. " --class spad",             -- How to spawn the scratchpad
    rule      = { instance = "spad" },                   -- The rule that the scratchpad will be searched by
    sticky    = true,                                    -- Whether the scratchpad should be sticky
    autoclose = true,                                    -- Whether it should hide itself when losing focus
    floating  = true,                                    -- Whether it should be floating (MUST BE TRUE FOR ANIMATIONS)
    geometry  = {x=200, y=100, height=700, width=1200},  -- The geometry in a floating state
    reapply   = true,                                    -- Whether all those properties should be reapplied on every new opening of the scratchpad (MUST BE TRUE FOR ANIMATIONS)
    dont_focus_before_close  = false,                    -- When set to true, the scratchpad will be closed by the toggle function regardless of whether its focused or not. When set to false, the toggle function will first bring the scratchpad into focus and only close it on a second call
}

awful.keyboard.append_global_keybindings({
    awful.key({ modkey,           }, "n", function() term_scratch:toggle() end,
              {description="launch terminal scratchpad", group="launcher"}),
})
