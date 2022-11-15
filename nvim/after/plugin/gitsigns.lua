--<< GITSIGNS >>--

--<< Protected call
local gitsigns_status, gitsigns = pcall(require, "gitsigns")
if not gitsigns_status then
    return
end

--<< Vars
local nosilent = { noremap = true, silent = false }
local silent   = { noremap = true, silent = true }
local keymap   = vim.keymap.set

--<< Setup
gitsigns.setup({
    signs = {
        add          = { hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
        change       = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        delete       = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        topdelete    = { hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
        untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
})

--<< Keys
keymap( "n", "<Leader>gss", "<CMD>Gitsigns toggle_signs<CR>", silent )
keymap( "n", "<Leader>gsn", "<CMD>Gitsigns toggle_numhl<CR>", silent )
keymap( "n", "<Leader>gsl", "<CMD>Gitsigns toggle_linehl<CR>", silent )
