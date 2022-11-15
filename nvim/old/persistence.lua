--<< PERSISTENCE SESSION MANAGER >>--

--<< Protected call
local persistence_status, persistence = pcall(require, "persistence")
if not persistence_status then
    return
end

--<<Vars
local keymap   = vim.keymap.set
local silent   = { noremap = true, silent = true }

--<< Setup
persistence.setup({
    dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"), -- directory where session files are saved
    options = { "buffers", "curdir", "tabpages", "winsize", "options" }, -- session options used for saving
})

--<< Keys
keymap( "n", "<Leader>sd", persistence.load, silent )
keymap( "n", "<Leader>sl", function ()
    persistence.load({ last = true })
end, silent )
keymap( "n", "<Leader>ss", persistence.stop, silent )
