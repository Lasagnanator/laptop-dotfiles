--<< BUFFERLINE >>--

--<< Protected call
local bufferline_status, bufferline = pcall(require, "bufferline")
if not bufferline_status then
    return
end

bufferline.setup({
    options = {
        mode = "tabs",
        numbers = "none",
        indicator = {
            style = "none",
            -- icon = "i", -- set style to "icon", otherwise this is pointless
        },
        max_name_length = 20,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 20,
        diagnostics = "nvim_lsp", -- false or "nvim_lsp"
        offsets = {
            {
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "TabLineFill",
                text_align = "center",
                separator = false,
            },
        },
        color_icons = true, -- whether or not to add the filetype icon highlights
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = false,
        show_buffer_default_icon = true, -- whether or not an unrecognised filetype should show a default icon
        show_close_icon = false,
        show_tab_indicators = false,
        separator_style = { "", "" },
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = { enabled = false },
        sort_by = "tabs",
    }
})
