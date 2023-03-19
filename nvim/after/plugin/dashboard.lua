--<< DASHBOARD >>--

--<< Protected call
local dashboard_status, dashboard = pcall(require, "dashboard")
if not dashboard_status then
    return
end

--<< Settings
dashboard.setup({
    theme = "doom",
    hide = {
        statusline = true,
        tabline = true,
        winbar = true,
    },
    preview = {
        command = "cat | lolcat -F 0.3",
        file_path = vim.fn.stdpath("config") .. "/nvim-headers/skull.txt",
        file_height = 20,
        file_width = 75,
    },
    config = {
        center = {
            {
                icon = "   ",
                desc = "New file",
                key = "n",
                action = "enew"
            },
            {
                icon = "   ",
                desc = "Restore last session",
                key = "l",
                action = "SessionManager load_last_session"
            },
            {
                icon = "   ",
                desc = "Restore directory session",
                key = "s",
                action = "SessionManager load_current_dir_session"
            },
            {
                icon = "   ",
                desc = "Search folder",
                key = "f",
                action = "Telescope find_files"
            },
            {
                icon = "   ",
                desc = "Find word",
                key = "w",
                action = "Telescope live_grep"
            },
            {
                icon = "   ",
                desc = "File browser",
                key = "e",
                action = "Telescope file_browser"
            },
            {
                icon = "   ",
                desc = "Quit Neovim",
                key = "q",
                action = ":q!"
            },
        },
        footer = {
            [[]],
            [[ I am a monument to all your sins. ]],
        },
    },
})

