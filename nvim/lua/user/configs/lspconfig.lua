--<< LSPCONFIG >>--

--<< Vars
local options = { noremap = true, silent = false }
local keymap = vim.keymap.set

--<< Keymaps
keymap ("n", "<Leader>le", vim.diagnostic.open_float, options )
keymap ("n", "<C-[>",     vim.diagnostic.goto_prev,  options )
keymap ("n", "<C-]>",     vim.diagnostic.goto_next,  options )

--<< Settings
-- vim.cmd ([[sign define DiagnosticSignError text= texthl=Error]])
-- vim.cmd ([[sign define DiagnosticSignWarn text= texthl=Warn]])
-- vim.cmd ([[sign define DiagnosticSignInfo text= texthl=Info]])
-- vim.cmd ([[sign define DiagnosticSignHint text= texthl=Hint]])
