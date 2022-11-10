--<< LUASNIP >>--

--<< Protected call
local luasnip_status, luasnip = pcall(require, "luasnip.loaders.from_vscode")
if not luasnip_status then
    return
end

--<< Initialization
luasnip.lazy_load()
