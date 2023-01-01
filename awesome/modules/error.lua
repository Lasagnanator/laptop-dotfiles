-- Standard awesome library
local gears         = require("gears")
local awful         = require("awful")
-- Notification library
local naughty       = require("naughty")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "WTF were u doin"..(startup and " while starting this shit" or "?"),
        message = message
    }
end)
-- }}}
