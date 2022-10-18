vim.g.mapleader      = " "
vim.g.maplocalleader = " "

local options = { noremap = true, silent = false }
local keymap = vim.keymap.set
local apimap = vim.api.nvim_set_keymap

keymap( "", "<Space>", "<Nop>", options )

--< NORMAL MODE >--

-- Base
keymap( "n", "<Leader>w",     ":w<CR>",                  options )
keymap( "n", "<Leader>q",     ":q!<CR>",                 options )
keymap( "n", "<Leader>W",     ":wa<CR>",                 options )
keymap( "n", "<Leader>Q",     ":qa!<CR>",                options )
keymap( "n", "<Leader>e",     ":e ",                     options )
keymap( "n", "<Leader>@",     ":set cursorcolumn!<CR>",  options )

-- Window management
keymap( "n", "<Leader>v",     ":vsplit ",                options )
keymap( "n", "<Leader>s",     ":split ",                 options )
keymap( "n", "<Leader>o",     "<C-W>o",                  options )
keymap( "n", "<Leader><bar>", "<C-W><bar>",              options )
keymap( "n", "<Leader>_",     "<C-W>_",                  options )

-- Move between windows
keymap( "n", "<C-h>",         "<C-W>h",                  options )
keymap( "n", "<C-j>",         "<C-W>j",                  options )
keymap( "n", "<C-k>",         "<C-W>k",                  options )
keymap( "n", "<C-l>",         "<C-W>l",                  options )

-- Move windows
keymap( "n", "<A-h>",         "<C-W>H",                  options )
keymap( "n", "<A-j>",         "<C-W>J",                  options )
keymap( "n", "<A-k>",         "<C-W>K",                  options )
keymap( "n", "<A-l>",         "<C-W>L",                  options )

-- Resize windows
keymap( "n", "<C-Left>",      ":vertical resize -1<CR>", options )
keymap( "n", "<C-Right>",     ":vertical resize +1<CR>", options )
keymap( "n", "<C-Up>",        ":resize +1<CR>",          options )
keymap( "n", "<C-Down>",      ":resize -1<CR>",          options )

-- Tabs
keymap( "n", "<Leader>t",     ":tabnew ",                options )
keymap( "n", "<C-.>",         ":tabnext<CR>",            options )
keymap( "n", "<C-,>",         ":tabprevious<CR>",        options )
keymap( "n", "<A-.>",         ":+tabmove<CR>",           options )
keymap( "n", "<A-,>",         ":-tabmove<CR>",           options )

--< VISUAL MODE >--

-- Normal
keymap( "v", ">",     ">gv",             options )
keymap( "v", "<",     "<gv",             options )
keymap( "v", "p",     '"_dP',            options )
keymap( "v", "<A-j>", ":move .+1<CR>==", options )
keymap( "v", "<A-k>", ":move .-1<CR>==", options )

-- Block
keymap( "x", "<A-j>", ":move '>+1<CR>gv-gv", options )
keymap( "x", "<A-k>", ":move '<-2<CR>gv-gv", options )

--< ALTERNATIVES >--

-- keymap( "n", "<Leader>v",     "<C-W>v<C-W>l:e ", options )
-- keymap( "n", "<Leader>s",     "<C-W>s<C-W>j:e ", options )
-- keymap( "x", "<A-h>", ":move '>+1<CR>gv-gv", options )       -- Need to move text laterally
-- keymap( "x", "<A-l>", ":move '<-2<CR>gv-gv", options )       -- Need to move text laterally
