local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

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
]]
