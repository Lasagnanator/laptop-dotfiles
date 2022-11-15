--<< DASHBOARD >>--

--<< Protected call
local dashboard_status, dashboard = pcall(require, "dashboard")
if not dashboard_status then
    return
end

--<< Settings
dashboard.preview_command = "cat | lolcat -F 0.3"
dashboard.preview_file_path = vim.fn.stdpath("config") .. "/nvim-headers/skull.txt"
dashboard.preview_file_height = 18
dashboard.preview_file_width = 75

dashboard.custom_footer = {
    [[]],
    [[ I am a monument to all your sins. ]],
}

dashboard.custom_center = {
    {
        icon = "m   ",
        desc = "New file                             ",
        shortcut = " N/A ",
        action = "DashboardNewFile"
    },
    {
        icon = "m   ",
        desc = "Restore last session                ",
        shortcut = "SPC s l",
        action = "SessionManager load_last_session"
    },
    {
        icon = "m   ",
        desc = "Restore directory session           ",
        shortcut = "SPC s d",
        action = "SessionManager load_current_dir_session"
    },
    {
        icon = "m   ",
        desc = "Search folder                       ",
        shortcut = "SPC f f",
        action = "Telescope find_files"
    },
    {
        icon = "m   ",
        desc = "Find word                           ",
        shortcut = "SPC f h",
        action = "Telescope live_grep"
    },
    {
        icon = "m   ",
        desc = "File browser                        ",
        shortcut = "SPC f e",
        action = "Telescope file_browser"
    },
    {
        icon = "m   ",
        desc = "Quit Neovim                          ",
        shortcut = "SPC q",
        action = ":q!"
    },
}
