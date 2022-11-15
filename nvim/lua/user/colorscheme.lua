--<< COLORSCHEME & THEMEING >>--

--<< Selected colorscheme
local colorscheme = "tokyonight"

--<< Load colorscheme settings
require("user.colorschemes." .. colorscheme)

--<< Set colorscheme and manage errors
local colorcheme_status, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not colorcheme_status then
    vim.notify("Colorscheme " .. colorscheme .. "not found, loading default")
    return
end

--<< Set background to transparent
-- vim.cmd("highlight Normal guibg=none cterm=none")
-- vim.cmd("highlight NonText guibg=none cterm=none")
