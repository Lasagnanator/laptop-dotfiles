local cmp     = require("cmp")
local luasnip = require("luasnip")

local kind_icons = {
  Text          = "m", -- "\uf77e",
  Method        = "m", -- "m",
  Function      = "m", -- "\uf794",
  Constructor   = "m", -- "\uf425",
  Field         = "m", -- "\ue716",
  Variable      = "m", -- "\uf6a6",
  Class         = "m", -- "\uf816",
  Interface     = "m", -- "\uf0e8",
  Module        = "m", -- "\uf487",
  Property      = "m", -- "\uf0ad",
  Unit          = "m", -- "\ue21f",
  Value         = "m", -- "\uf89f",
  Enum          = "m", -- "\uf15d",
  Keyword       = "m", -- "\uf80a",
  Snippet       = "m", -- "\uf0c4",
  Color         = "m", -- "\uf8d7",
  File          = "m", -- "\uf718",
  Reference     = "m", -- "\uf481",
  Folder        = "m", -- "\uf74a",
  EnumMember    = "m", -- "\uf15d",
  Constant      = "m", -- "\uf6fc",
  Struct        = "m", -- "\uf1b3",
  Event         = "m", -- "\uf0e7",
  Operator      = "m", -- "\uf694",
  TypeParameter = "m", -- "\uf783",
}

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<C-j>"]     = cmp.mapping.scroll_docs(-1),
        ["<C-k>"]     = cmp.mapping.scroll_docs(1),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"]     = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif check_backspace() then
                fallback()
            else
                fallback()
            end
        end, { "i", "s", }),
        ["<S-Tab>"]   = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s", }),
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.menu = ({
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.
        { name = "buffer" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
})

-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--             { name = 'buffer' },
--         })
-- })
-- 
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = 'buffer' }
--     }
-- })
-- 
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--             { name = 'cmdline' }
--         })
-- })
-- 
-- -- Set up lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--     capabilities = capabilities
-- })
