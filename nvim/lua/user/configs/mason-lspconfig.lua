--<< MASON LSPCONFIG >>--

--<< Protected calls
local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_status then
    return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

--<<Keybinds to attach to buffer when LSP is loaded
---@diagnostic disable-next-line: unused-local
local on_attach = function(client, bufnr)
    -- Mappings.
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "<Leader>lr",  vim.lsp.buf.rename,                  bufopts)
    vim.keymap.set("n", "<Leader>ld",  vim.lsp.buf.definition,              bufopts)
    vim.keymap.set("n", "<Leader>lt",  vim.lsp.buf.type_definition,         bufopts)
    vim.keymap.set("n", "<Leader>li",  vim.lsp.buf.hover,                   bufopts)
    vim.keymap.set("n", "<Leader>lwa", vim.lsp.buf.add_workspace_folder,    bufopts)
    vim.keymap.set("n", "<Leader>lwr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<Leader>lwl", function ()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<Leader>lc",  vim.lsp.buf.code_action,             bufopts)
    vim.keymap.set("n", "<Leader>ls",  vim.lsp.buf.references,              bufopts)
    vim.keymap.set("n", "<Leader>lpp", function ()
        vim.lsp.buf.format ({
            async = true
        })
    end, bufopts)
end

--<< Settings
mason_lsp.setup({
    ensure_installed = { "sumneko_lua", "bashls", "pyright" }, -- If not found, download and install declared LSPs
             })
--<< LSP servers setup (handlers)
mason_lsp.setup_handlers({
    -- Default handler
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = on_attach
        })
    end,
    -- Personalized handlers
    ["sumneko_lua"] = function()
        lspconfig.sumneko_lua.setup({
            on_attach = on_attach,
            on_new_config = function(client)
                -- if vim.fn.expand('%:p'):match("/awesome/") then
                if vim.api.nvim_buf_get_name(0):match("/awesome/") then
                    for _, val in ipairs({ "awesome", "client", "screen" }) do
                        table.insert(client.settings.Lua.diagnostics.globals, val)
                    end
                end
            end,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })
    end,
    ["pyright"] = function()
        lspconfig.pyright.setup({
            on_attach = on_attach,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        diagnosticMode = "workspace",
                        useLibraryCodeForTypes = true,
                        typeCheckingMode = "off", -- Options: off, basic, strict
                    },
                },
            },
        })
    end,
    ["jsonls"] = function()
        lspconfig.jsonls.setup({
            on_attach = on_attach,
            settings = {
                schemas = require("schemastore").json.schemas({
                    select = {}
                }),
                validate = { enable = true },
            },
        })
    end,
})
--[[
→ json.colorDecorators.enable  default: true
→ json.format.enable           default: true
→ json.format.keepLines        default: false
→ json.maxItemsComputed        default: 5000
→ json.schemaDownload.enable   default: true
→ json.schemas                
→ json.trace.server            default: "off"
→ json.validate.enable         default: true
--
--]]
