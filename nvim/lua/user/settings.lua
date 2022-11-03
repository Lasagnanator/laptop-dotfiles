local settings = {
    number          = true,
    relativenumber  = true,
    numberwidth     = 5,
    signcolumn      = "yes",
    cursorline      = true,
    cursorlineopt   = "number",
    autoindent      = true,
    expandtab       = true,
    shiftwidth      = 4,
    tabstop         = 4,
    wrap            = false,
    showmode        = true,
    hlsearch        = false,
    termguicolors   = true,
    mouse           = "a",
    splitbelow      = true,
    splitright      = true,
    undofile        = true,
    showmode        = false,
    -- iskeyword       = "-+",         -- not sure this is the correct syntax
}

for k, v in pairs(settings) do
    vim.opt[k] = v
end
