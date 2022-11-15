--<< DIFFVIEW >>--

--<< Protected call
local diffview_status, diffview = pcall(require, "diffview")
if not diffview_status then
    return
end

--<< Vars
local nosilent = { noremap = true, silent = false }
local silent   = { noremap = true, silent = true }
local keymap   = vim.keymap.set

--<< Setup
diffview.setup({})

--<< Keys
keymap( "n", "<Leader>gdo", "<CMD>DiffViewOpen<CR>", silent )
