--<< NVIM-TREE FILE EXPLORER >>--

-- Protected calls
local nvim_tree_status, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status then
    return
end

local api_status, api = pcall(require, "nvim-tree.api")
if not api_status then
    return
end


--<< Vars
local keymap   = vim.keymap.set
local keymap_remove = vim.keymap.del
local silent   = { noremap = true, silent = true }

--<< Settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

--<< Function
local function on_attach(bufnr)

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Set defaults
      api.config.mappings.default_on_attach(bufnr)

    -- Remove from defaults
    keymap('n', '<C-[>', '', { buffer = bufnr })
    keymap('n', '<C-]>', '', { buffer = bufnr })
    keymap_remove('n', '<C-[>', { buffer = bufnr })
    keymap_remove('n', '<C-]>', { buffer = bufnr })

    -- Set keybinds
    keymap('n', '}', api.tree.change_root_to_node, opts('CD'))
    keymap('n', '{', api.tree.change_root_to_parent, opts('Up'))

end

nvim_tree.setup({
    on_attach = on_attach,
    -- view = {
    --     mappings = {
    --         list = {
    --             -- Remove unusued ones
    --             { key = { "<C-[>" , "<C-]>" }, action = "" },
    --             { key = "}", action = "cd" },
    --             { key = "{", action = "dir_up" },
    --         },
    --     },
    -- },
})


--<< Keys
keymap("n", "<Leader>ee", function ()
    api.tree.toggle({
        focus = false
    })
end, silent)
keymap("n", "<Leader>ew", api.tree.focus,  silent)
