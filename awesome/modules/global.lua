--<< GLOBAL VALUES BITCHES >>--

--<< AwesomeWM modules
local gears = require('gears')

local global = {}

global.modkey       = "Mod4"
global.terminal     = "kitty"
global.browser      = "firefox"
global.editor       = os.getenv("EDITOR") or "nvim"
global.launcher     = "rofi -show drun"
global.explorer     = "ranger"
global.editor_cmd   = global.terminal .. " -e " .. global.editor
global.explorer_cmd = global.terminal .. " " .. global.explorer
global.theme        = "custom"
global.theme_path   = gears.filesystem.get_configuration_dir() .. "themes/" .. global.theme .. "/"

return global
