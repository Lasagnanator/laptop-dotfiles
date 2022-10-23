local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

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

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
        ["<C-k>"]     = cmp.mapping.select_prev_item(),
		["<C-j>"]     = cmp.mapping.select_next_item(),
        ["<C-b>"]     = cmp.mapping.scroll_docs(-1),
        ["<C-f>"]     = cmp.mapping.scroll_docs(1),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-y>"]     = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ["<C-l>"]     = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<CR>"]      = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
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
                nvim_lsp      = "[LSP]",
                luasnip       = "[Snippet]",
                buffer        = "[Buffer]",
                path          = "[Path]",
                nerdfont      = "[Nerdfont]",
                latex_symbols = "[LaTeX]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
    }, {
        { name = "buffer" },
        { name = "path" },
    }),
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
})

-- Configuration for tex files
cmp.setup.filetype({ "tex", "plaintex" }, {
    sources = cmp.config.sources({
        { name = "latex_symbols" },
        { name = "nerdfont" },
    })
})

-- Configuration for markdown files
cmp.setup.filetype("markdown", {
    sources = cmp.config.sources({
        { name = "nerdfont" },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
