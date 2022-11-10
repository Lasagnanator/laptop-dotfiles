--<< COMPLETION PLUGIN >>--

--<< Protected calls
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
    return
end

local snip_status, luasnip = pcall(require, "luasnip")
if not snip_status then
    return
end

--<< Kind icons definition
local kind_icons = {
    Text          = " ",
    Method        = "m ",
    Function      = " ",
    Constructor   = " ",
    Field         = " ",
    Variable      = " ",
    Class         = " ",
    Interface     = " ",
    Module        = " ",
    Property      = " ",
    Unit          = " ",
    Value         = " ",
    Enum          = " ",
    Keyword       = " ",
    Snippet       = " ",
    Color         = " ",
    File          = " ",
    Reference     = " ",
    Folder        = " ",
    EnumMember    = " ",
    Constant      = " ",
    Struct        = " ",
    Event         = " ",
    Operator      = " ",
    TypeParameter = " ",
}

--<< Setup
cmp.setup({
    snippet = { -- Snippet engine call
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    window = { -- Borders
        -- completion    = cmp.config.window.bordered("single"),
        -- documentation = cmp.config.window.bordered("single"),
    },
    mapping = cmp.mapping.preset.insert({ -- Keybinds
        ["<C-k>"]     = cmp.mapping.select_prev_item(),
        ["<C-j>"]     = cmp.mapping.select_next_item(),
        ["<C-b>"]     = cmp.mapping.scroll_docs(-2),
        ["<C-f>"]     = cmp.mapping.scroll_docs(2),
        ["<C-Space>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.abort()
            else
                cmp.complete()
            end
        end, { "i", "s" }),
        ["<CR>"]      = cmp.mapping.confirm({ select = false }), -- False requires selection, true autoselects first result
        ["<Tab>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind]) -- Kind icons
            vim_item.menu = ({ -- Menu items name
                nvim_lsp      = "[LSP]",
                luasnip       = "[Snippet]",
                buffer        = "[Buffer]",
                path          = "[Path]",
                nerdfont      = "[NerdFont]",
                emoji         = "[Emoji]",
                latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = cmp.config.sources({ -- Sources for all files
        { name = "luasnip" },
        { name = "nvim_lsp" },
    }, {
            { name = "buffer" },
        })
})

--<< Configuration for tex files
cmp.setup.filetype({ "tex", "plaintex" }, {
    sources = cmp.config.sources({
        { name = "latex_symbols" },
        { name = "nerdfont" },
        { name = "emoji" },
    })
})

--<< Configuration for markdown files
cmp.setup.filetype("markdown", {
    sources = cmp.config.sources({
        { name = "nerdfont" },
        { name = "emoji" },
    })
})

--<< Configuration for gitcommit files
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
            { name = "buffer" },
        })
})

--<< Use buffer source for `/` and `?` (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" }
    }
})

--<< Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
cmp.setup.cmdline({ ":", "!" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    }, {
            { name = "cmdline" },
            { name = "buffer" }
        })
})

--<< Set up lspconfig (needed?)
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig    = require("lspconfig")
local mason        = require("mason-lspconfig")
local servers      = mason.get_installed_servers()

for _, server in ipairs(servers) do
    lspconfig[server].setup({
        capabilities = capabilities
    })
end
