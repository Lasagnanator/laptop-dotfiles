-- Standard awesome library
local gears         = require("gears")
local awful         = require("awful")
-- require("awful.autofocus") -- [needed?]
-- Widget and layout library
local wibox         = require("wibox")
-- Theme handling library
local beautiful     = require("beautiful")
-- Notification library
local naughty       = require("naughty")
-- Declarative object management
local ruled         = require("ruled")
local menubar       = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
                      require("awful.hotkeys_popup.keys")

-- {{{ Organized modules for cleaner code
local global = require("configs.global")
               require("configs.keybindings")
               require("configs.buttons")
--               require("configs.functions")
--               require("configs.widgets")
--               require("configs.bar")
--               require("configs.rules")

local bling  = require("bling")

-- {{{ Variables
modkey       = global.modkey
terminal     = global.terminal
browser      = global.browser
editor       = global.editor
explorer     = global.explorer
editor_cmd   = global.editor_cmd
explorer_cmd = global.explorer_cmd

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
    awful.key({ modkey, "Mod1"    }, "u", function() term_scratch:toggle() end,
              {description="launch terminal scratchpad", group="launcher"}),
})
