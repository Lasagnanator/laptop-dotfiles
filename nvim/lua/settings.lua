local settings = {
    number         = true,
    relativenumber = true,
    numberwidth    = 4,
    cursorline     = true,
    cursorlineopt  = "number",
    autoindent     = true,
    expandtab      = true,
    shiftwidth     = 4,
    tabstop        = 4,
    showmode       = true,
    hlsearch       = false,
    termguicolors  = true,
}

for k, v in pairs(settings) do
    vim.opt[k] = v
end

vim.cmd [[
    colorscheme dracula
]]
