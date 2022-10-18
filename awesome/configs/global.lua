-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
-- Declarative object management
local ruled = require("ruled")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")

local global = {}

global.modkey       = "Mod4"
global.terminal     = "kitty"
global.browser      = "firefox"
global.editor       = os.getenv("EDITOR") or "nvim"
global.launcher     = "rofi -show drun"
global.explorer     = "ranger"
global.editor_cmd   = global.terminal .. " -e " .. global.editor
global.explorer_cmd = global.terminal .. " . " .. global.explorer
global.theme        = "custom"
global.theme_path   = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), global.theme)

return global
