--<< TELESCOPE >>--

--<< Protected call
local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    return
end

--<< Vars
local keymap   = vim.keymap.set
local silent   = { noremap = true, silent = true }
local builtin  = require("telescope.builtin")

--<< Extensions
telescope.load_extension("fzf")
telescope.load_extension("file_browser")
telescope.load_extension("ui-select")

--<< Settings
telescope.setup({
    defaults = {},
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
        buffers = {
        --TODO: check if a better map is possible
            mappings = {
                i = {
                    ["<C-k>"] = "delete_buffer",
                },
                n = {
                    ["<C-k>"] = "delete_buffer",
                },
            }
        }
    },
})

--<< Functions
local find_git_fallback = function()
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
        builtin.git_files()
    else
        builtin.find_files()
    end
end

local file_browser = telescope.extensions.file_browser.file_browser

--<< Keys
keymap( "n", "<Leader>ff", builtin.find_files,     silent )
keymap( "n", "<Leader>fl", builtin.live_grep,      silent )
keymap( "n", "<Leader>fb", builtin.buffers,        silent )
keymap( "n", "<Leader>fh", builtin.help_tags,      silent )
keymap( "n", "<Leader>fg", find_git_fallback,      silent )
keymap( "n", "<Leader>fe", file_browser,           silent )
keymap( "n", "<Leader>ls", function ()
    builtin.lsp_references({
        include_current_line = true,
    })
end, silent )
