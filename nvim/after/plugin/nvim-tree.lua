--<< NVIM-TREE FILE EXPLORER >>--

-- Protected calls
local nvim_tree_status, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status then
    return
end

--<< Vars
local keymap   = vim.keymap.set
local silent   = { noremap = true, silent = true }

--<< Settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
    view = {
        mappings = {
            list = {
                -- Remove unusued ones
                { key = { "<C-[>" , "<C-]>" }, action = "" },
                { key = "}", action = "cd" },
                { key = "{", action = "dir_up" },
            },
        },
    },
})


--<< Keys
keymap( "n", "<Leader>ee", nvim_tree.toggle, silent )
keymap( "n", "<Leader>ew", nvim_tree.focus,  silent )
