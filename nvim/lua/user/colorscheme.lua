-- Selected colorscheme
local colorscheme = "tokyonight"

-- Manage error if colorscheme not found
local status_ok, _ = pcall ( vim.cmd, "colorscheme " .. colorscheme )
if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. "not found, loading default")
    return
end

-- Set background to transparent
vim.cmd("highlight Normal guibg=none cterm=none")
vim.cmd("highlight NonText guibg=none cterm=none")
