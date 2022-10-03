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

local global = {
    modkey   = "Mod4",
    terminal = "kitty",
    browser  = "firefox",
    editor   = os.getenv("EDITOR") or "nvim",
    -- explorer = "ranger",
}

global.editor_cmd   = global.terminal .. " -e " .. global.editor
-- global.explorer_cmd = global.terminal .. " . " .. global.explorer

return global
