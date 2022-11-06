local settings = {
  number         = true,
  relativenumber = true,
  numberwidth    = 5,
  signcolumn     = "yes",
  cursorline     = true,
  cursorlineopt  = "number",
  autoindent     = true,
  expandtab      = true,
  shiftwidth     = 2,
  tabstop        = 2,
  softtabstop    = 2,
  wrap           = false,
  showmode       = false,
  hlsearch       = false,
  termguicolors  = true,
  mouse          = "a",
  splitbelow     = true,
  splitright     = true,
  undofile       = true,
  -- iskeyword       = "-+",         -- not sure this is the correct syntax
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end
