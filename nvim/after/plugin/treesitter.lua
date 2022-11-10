--<< TREESITTER >>--

--<< Protected call
local nvim_treesitter_status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not nvim_treesitter_status then
    return
end

nvim_treesitter.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  }
}
