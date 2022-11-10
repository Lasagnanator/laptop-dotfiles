--<< REMAPS >>--

--<< Vars
local nosilent = { noremap = true, silent = false }
local silent   = { noremap = true, silent = true }
local keymap   = vim.keymap.set
local builtin  = require("telescope.builtin")

--<< Leader key
vim.g.mapleader      = " "
vim.g.maplocalleader = " "
keymap( "", "<Space>", "<Nop>", silent )

--<< Functions
local find_git_fallback = function()
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

--<< NORMAL MODE >>--

--<< Base
keymap( "n", "<Leader>w",     ":w<CR>",                  silent )
keymap( "n", "<Leader>q",     ":q!<CR>",                 silent )
keymap( "n", "<Leader>W",     ":wa<CR>",                 silent )
keymap( "n", "<Leader>Q",     ":qa!<CR>",                silent )
keymap( "n", "<Leader>@",     ":set cursorcolumn!<CR>",  silent )
keymap( "n", "<S-k>",         "k<S-j>",                  silent )

--<< Window management
keymap( "n", "<Leader>v",     ":vsplit ",                nosilent )
keymap( "n", "<Leader>s",     ":split ",                 nosilent )
keymap( "n", "<Leader>o",     "<C-W>o",                  silent )
keymap( "n", "<Leader><bar>", "<C-W><bar>",              silent )
keymap( "n", "<Leader>_",     "<C-W>_",                  silent )

--<< Move between windows
keymap( "n", "<C-h>",         "<C-W>h",                  silent )
keymap( "n", "<C-j>",         "<C-W>j",                  silent )
keymap( "n", "<C-k>",         "<C-W>k",                  silent )
keymap( "n", "<C-l>",         "<C-W>l",                  silent )

--<< Move windows
keymap( "n", "<A-h>",         "<C-W>H",                  silent )
keymap( "n", "<A-j>",         "<C-W>J",                  silent )
keymap( "n", "<A-k>",         "<C-W>K",                  silent )
keymap( "n", "<A-l>",         "<C-W>L",                  silent )

--<< Resize windows
keymap( "n", "<C-Left>",      ":vertical resize -1<CR>", silent )
keymap( "n", "<C-Right>",     ":vertical resize +1<CR>", silent )
keymap( "n", "<C-Up>",        ":resize +1<CR>",          silent )
keymap( "n", "<C-Down>",      ":resize -1<CR>",          silent )

--<< Tabs
keymap( "n", "<Leader>t",     ":tabnew ",                silent )
keymap( "n", "<C-.>",         ":tabnext<CR>",            silent )
keymap( "n", "<C-,>",         ":tabprevious<CR>",        silent )
keymap( "n", "<A-.>",         ":+tabmove<CR>",           silent )
keymap( "n", "<A-,>",         ":-tabmove<CR>",           silent )

--<< Plugin
keymap( "n", "<C-p>c",        ":PackerCompile<CR>\
                               :PackerInstall<CR>",      nosilent )
keymap( "n", "<C-p>u",        ":PackerSync<CR>\
                               :TSUpdate<CR>",           nosilent )
keymap( "n", "<Leader>lm",    ":Mason<CR>",              silent )
keymap( "n", "<Leader>ff",    builtin.find_files,        silent )
keymap( "n", "<Leader>fl",    builtin.live_grep,         silent )
keymap( "n", "<Leader>fb",    builtin.buffers,           silent )
keymap( "n", "<Leader>fh",    builtin.help_tags,         silent )
keymap( "n", "<Leader>fg",    find_git_fallback,         silent )

--<< VISUAL MODE >>--

--<< Normal
keymap( "v", ">",             ">gv",                     silent )
keymap( "v", "<",             "<gv",                     silent )
keymap( "v", "p",             '"_dP',                    silent )
keymap( "v", "<A-j>",         ":move .+1<CR>==",         silent )
keymap( "v", "<A-k>",         ":move .-1<CR>==",         silent )

--<< Block
keymap( "x", "<A-j>",         ":move '>+1<CR>gv-gv",     silent )
keymap( "x", "<A-k>",         ":move '<-2<CR>gv-gv",     silent )

--<< ALTERNATIVES >>--

-- keymap( "n", "<Leader>v",     "<C-W>v<C-W>l:e ", options )
-- keymap( "n", "<Leader>s",     "<C-W>s<C-W>j:e ", options )
-- keymap( "x", "<A-h>", ":move '>+1<CR>gv-gv", options )       -- Need to move text laterally
-- keymap( "x", "<A-l>", ":move '<-2<CR>gv-gv", options )       -- Need to move text laterally
