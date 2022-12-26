--<< NVIM TREESITTER CONTEXT >>--

--<< Protected calls
local nvim_treesitter_context_status, nvim_treesitter_context = pcall(require, "treesitter-context")
if not nvim_treesitter_context_status then
    return
end

--<< Settings
nvim_treesitter_context.setup({})
