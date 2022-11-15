--<< PERSISTED >>--

--<< Protected call
local persisted_status, persisted = pcall(require, "persisted")
if not persisted_status then
    return
end

--<<Vars
local keymap   = vim.keymap.set
local silent   = { noremap = true, silent = true }

--<< Settings
persisted.setup({
    save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved})
    silent = false, -- silent nvim message when sourcing session file
    autosave = true, -- automatically save session files when exiting Neovim
    follow_cwd = true, -- change session file name to match current working directory if it changes
})

--<< Keys
keymap( "n", "<Leader>sl", ":SessionLoadLast<CR>", silent )
keymap( "n", "<Leader>sd", ":SessionLoad<CR>",     silent )
-- keymap( "n", "<Leader>ss", ":SessionManager load_session<CR>", silent )
-- keymap( "n", "<Leader>sr", ":SessionManager delete_session<CR>", silent )
