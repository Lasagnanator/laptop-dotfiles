--<< WEB DEVICON >>--

--<< Protected call
local web_devicons_status, web_devicons = pcall(require, "nvim-web-devicons")
if not web_devicons_status then
    return
end

web_devicons.setup({
    default = true,
    color_icons = true,
})
