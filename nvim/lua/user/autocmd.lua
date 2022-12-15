--<< AUTOCOMMANDS >>--

--<< Vars
local autocmd = vim.api.nvim_create_autocmd

--<< Functions
local set_ft_conf = function ()
    vim.cmd([[:set ft=conf]])
    -- vim.cmd([[: 'Set filetype to "conf" with autocommand']])
end

--<< Autocommands
-- autocmd({ 'BufEnter', 'BufWinEnter' }, {
--     pattern = '*.conf',
--     callback = set_ft_conf
-- })
