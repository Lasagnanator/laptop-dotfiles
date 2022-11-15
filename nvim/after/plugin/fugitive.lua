--<< FUGITIVE >>--

--<< Protected call
local fugitive_status = pcall(require, "fugitive")
if not fugitive_status then
    return
end

--<< Vars
local nosilent = { noremap = true, silent = false }
local silent   = { noremap = true, silent = true }
local keymap   = vim.keymap.set

--<< Keys
