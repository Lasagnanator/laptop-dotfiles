local settings = {
    number         = true,
    relativenumber = true,
    numberwidth    = 5,
    signcolumn     = "number",
    cursorline     = true,
    cursorlineopt  = "number",
    autoindent     = true,
    expandtab      = true,
    shiftwidth     = 4,
    tabstop        = 4,
    showmode       = true,
    hlsearch       = false,
    termguicolors  = true,
    mouse          = "a",
}

for k, v in pairs(settings) do
    vim.opt[k] = v
end

vim.cmd [[
    colorscheme dracula
    highlight Normal guibg=none cterm=none
    highlight NonText guibg=none cterm=none
]]
