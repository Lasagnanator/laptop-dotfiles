--<< NVIM-TREE FILE EXPLORER >>--

-- Protected calls
local nvim_tree_status, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status then
    return
end

--<< Settings
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({})
