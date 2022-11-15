--<< TOGGLETERM >>--

--<< Protected call
local toggleterm_status, toggleterm = pcall(require, "toggleterm")
if not toggleterm_status then
    return
end

--<< Vars
local keymap = vim.keymap.set
local silent = { noremap = true, silent = true }

--<< Setup
toggleterm.setup({
    open_mapping = [[<c-\>]],
    shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
})

--<< Custom terminals
local terminal = require("toggleterm.terminal").Terminal

local floating = terminal:new({
    direction = "float"
})

local toggle_floating = function ()
    floating:toggle()
end

--<< Keys
keymap( "x", "<Leader>tl", "<CMD>ToggleTermSendVisualSelection<CR>", silent )
keymap( "n", "<Leader>tl", "<CMD>ToggleTermSendCurrentLine<CR>",     silent )
keymap( "n", "<Leader>tf", toggle_floating,                          silent )
-- keymap( "n", "<Leader>tn", "<CMD>ToggleTermSetName<CR>",             silent )
keymap( "t", "<esc>",      [[<C-\><C-n>]],                           silent )
