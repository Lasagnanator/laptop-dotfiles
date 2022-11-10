--<< TELESCOPE >>--

--<< Protected call
local telescope_status, telescope = pcall(require, "telescope")
if not telescope_status then
    return
end

--<< Settings
telescope.setup({
    defaults = {},
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
        },
    },
})

--<< FZF call
telescope.load_extension("fzf")
