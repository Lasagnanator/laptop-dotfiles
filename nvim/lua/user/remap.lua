--<< REMAPS >>--

--<< Vars
local nosilent = { noremap = true, silent = false }
local silent   = { noremap = true, silent = true }
local keymap   = vim.keymap.set

--<< Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "
keymap( "", "<Space>", "<Nop>", silent )

--<< NORMAL MODE >>--

--<< Base
keymap( "n", "<Leader>w",     "<CMD>w<CR>",                  silent )
keymap( "n", "<Leader>q",     "<CMD>q!<CR>",                 silent )
keymap( "n", "<Leader>QW",    "<CMD>wa<CR>\
                               <CMD>qa<CR>",                 silent )
keymap( "n", "<Leader>W",     "<CMD>wa<CR>",                 silent )
keymap( "n", "<Leader>QQ",     "<CMD>qa!<CR>",                silent )
keymap( "n", "<Leader>@",     "<CMD>set cursorcolumn!<CR>",  silent )
keymap( "n", "<C-s>",         "<CMD>saveas ",                nosilent )
keymap( "n", "<S-k>",         "k<S-j>",                      silent )

--<< Window management
-- keymap( "n", "<Leader>v",     "<CMD>vsplit ",                nosilent )
-- keymap( "n", "<Leader>s",     "<CMD>split ",                 nosilent )
keymap( "n", "<Leader>o",     "<CMD>wincmd o<CR>",           silent )
keymap( "n", "<Leader><bar>", "<CMD>wincmd <bar><CR>",       silent )
keymap( "n", "<Leader>_",     "<CMD>wincmd _<CR>",           silent )

--<< Move between windows
keymap( "n", "<C-h>",         "<CMD>wincmd h<CR>",           silent )
keymap( "n", "<C-j>",         "<CMD>wincmd j<CR>",           silent )
keymap( "n", "<C-k>",         "<CMD>wincmd k<CR>",           silent )
keymap( "n", "<C-l>",         "<CMD>wincmd l<CR>",           silent )

--<< Move windows                           
keymap( "n", "<A-h>",         "<CMD>wincmd H<CR>",           silent )
keymap( "n", "<A-j>",         "<CMD>wincmd J<CR>",           silent )
keymap( "n", "<A-k>",         "<CMD>wincmd K<CR>",           silent )
keymap( "n", "<A-l>",         "<CMD>wincmd L<CR>",           silent )

--<< Resize windows
keymap( "n", "<C-Left>",      "<CMD>vertical resize -1<CR>", silent )
keymap( "n", "<C-Right>",     "<CMD>vertical resize +1<CR>", silent )
keymap( "n", "<C-Up>",        "<CMD>resize +1<CR>",          silent )
keymap( "n", "<C-Down>",      "<CMD>resize -1<CR>",          silent )

--<< Tabs
-- keymap( "n", "<Leader>t",     "<CMD>tabnew ",                silent )
keymap( "n", "<Leader>,",     "<CMD>tabclose<CR>",           silent )
keymap( "n", "<C-.>",         "<CMD>tabnext<CR>",            silent )
keymap( "n", "<C-,>",         "<CMD>tabprevious<CR>",        silent )
keymap( "n", "<A-.>",         "<CMD>+tabmove<CR>",           silent )
keymap( "n", "<A-,>",         "<CMD>-tabmove<CR>",           silent )

--<< Plugin
keymap( "n", "<C-p>c",        "<CMD>PackerCompile<CR>\
                               <CMD>PackerInstall<CR>",      nosilent )
keymap( "n", "<C-p>u",        "<CMD>PackerSync<CR>\
                               <CMD>TSUpdate<CR>",           nosilent )
keymap( "n", "<Leader>lm",    "<CMD>Mason<CR>",              nosilent )

--<< VISUAL MODE >>--

--<< Normal
keymap( "v", ">",             ">gv",                         silent )
keymap( "v", "<",             "<gv",                         silent )
keymap( "v", "p",             '"_dP',                        silent )
keymap( "v", "<A-j>",         "<CMD>move .+1<CR>==",         silent )
keymap( "v", "<A-k>",         "<CMD>move .-1<CR>==",         silent )

--<< Block
keymap( "x", "<A-j>",         "<CMD>move '>+1<CR>gv-gv",     silent )
keymap( "x", "<A-k>",         "<CMD>move '<-2<CR>gv-gv",     silent )

--<< ALTERNATIVES >>--

-- keymap( "n", "<Leader>v",     "<C-W>v<C-W>l<CMD>e ", options )
-- keymap( "n", "<Leader>s",     "<C-W>s<C-W>j<CMD>e ", options )
-- keymap( "x", "<A-h>", "<CMD>move '>+1<CR>gv-gv", options )       -- Need to move text laterally
-- keymap( "x", "<A-l>", "<CMD>move '<-2<CR>gv-gv", options )       -- Need to move text laterally
