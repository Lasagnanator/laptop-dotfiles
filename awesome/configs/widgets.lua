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

-- {{{ Modules
local global = require("configs.global")
-- }}}

-- {{{ Variables
modkey = global.modkey
terminal = global.terminal
browser = global.browser
editor = global.editor
explorer = global.explorer
editor_cmd = global.editor_cmd
explorer_cmd = global.explorer_cmd
-- }}}


