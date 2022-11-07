--<< LSPCONFIG (ALL PLUGINS) >>--

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
  --<< Vars
  local keymap  = vim.keymap.set
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  --<< Mappings
  keymap("n", "<Leader>le",  vim.diagnostic.open_float,           bufopts)
  keymap("n", "<C-[>",       vim.diagnostic.goto_prev,            bufopts)
  keymap("n", "<C-]>",       vim.diagnostic.goto_next,            bufopts)
  keymap("n", "<Leader>lr",  vim.lsp.buf.rename,                  bufopts)
  keymap("n", "<Leader>ld",  vim.lsp.buf.definition,              bufopts)
  keymap("n", "<Leader>li",  vim.lsp.buf.hover,                   bufopts)
  keymap("n", "<Leader>lc",  vim.lsp.buf.code_action,             bufopts)
  keymap("n", "<Leader>ls",  vim.lsp.buf.references,              bufopts)
  keymap("n", "<Leader>lt",  ":Trouble<CR>",                      bufopts)
  keymap("n", "<Leader>lwa", vim.lsp.buf.add_workspace_folder,    bufopts)
  keymap("n", "<Leader>lwr", vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap("n", "<Leader>lwl", function ()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap("n", "<Leader>lpp", function ()
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
            typeCheckingMode = "basic", -- Options: off, basic, strict
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
