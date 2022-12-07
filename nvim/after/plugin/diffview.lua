--<< DIFFVIEW >>--

--<< Protected call
local diffview_status, diffview = pcall(require, "diffview")
if not diffview_status then
    return
end

--<< Vars
local silent   = { noremap = true, silent = true }
local keymap   = vim.keymap.set
local actions  = require("diffview.actions")

--<< Setup
diffview.setup({
    enhanced_diff_hl = true,
    view = {
        default = { layout = 'diff2_horizontal' },
        merge_tool = {
            layout = 'diff3_mixed',
            disable_diagnostics = true,
        },
    },
    keymaps = {
        disable_defaults = false, -- Disable the default keymaps
        view = {
            -- The `view` bindings are active in the diff buffers, only when the current
            -- tabpage is a Diffview.
            { 'n', '<tab>',      actions.select_next_entry,         { desc = 'Open the diff for the next file' } },
            { 'n', '<s-tab>',    actions.select_prev_entry,         { desc = 'Open the diff for the previous file' } },
            { 'n', '<C-t>',      actions.goto_file_tab,             { desc = 'Open the file in a new tabpage' } },
            { 'n', '<Leader>ew', actions.focus_files,               { desc = 'Bring focus to the file panel' } },
            { 'n', '<Leader>ee', actions.toggle_files,              { desc = 'Toggle the file panel.' } },
            -- { 'n', 'g<C-x>',     actions.cycle_layout,              { desc = 'Cycle through available layouts.' } },
            { 'n', '<Leader>k',  actions.prev_conflict,             { desc = 'In the merge-tool: jump to the previous conflict' } },
            { 'n', '<Leader>j',  actions.next_conflict,             { desc = 'In the merge-tool: jump to the next conflict' } },
            { 'n', '<Leader>co', actions.conflict_choose('ours'),   { desc = 'Choose the OURS version of a conflict' } },
            { 'n', '<Leader>ct', actions.conflict_choose('theirs'), { desc = 'Choose the THEIRS version of a conflict' } },
            { 'n', '<Leader>cb', actions.conflict_choose('base'),   { desc = 'Choose the BASE version of a conflict' } },
            { 'n', '<Leader>ca', actions.conflict_choose('all'),    { desc = 'Choose all the versions of a conflict' } },
            { 'n', 'dx',         actions.conflict_choose('none'),   { desc = 'Delete the conflict region' } },
        },
    },
})

--<< Keys
keymap( 'n', '<Leader>lf', '<Cmd>DiffviewOpen<CR>',              silent )
keymap( 'n', '<Leader>lhd', '<Cmd>DiffviewFileHistory<CR>',      silent )
keymap( 'n', '<Leader>lhf', '<Cmd>DiffviewFileHistory %<CR>',    silent )
