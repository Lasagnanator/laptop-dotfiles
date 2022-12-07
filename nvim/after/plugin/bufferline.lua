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
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " " -- Equivalent to a if with the match as a condition
            return " " .. count .. icon
        end,
        custom_filter = function (buffer_number)
            local ft = vim.bo[buffer_number].filetype
            if  ft ~= "NvimTree"
            and ft ~= "TelescopePrompt"
            and ft ~= "DressingInput"
            and ft ~= "Trouble"
            and ft ~= "mason"
            and ft ~= "packer"
            and ft ~= "help"
            and ft ~= "wiki"
            and ft ~= "DiffviewFiles"
            and ft ~= "qf"
            then
                return true
            end
        end,
        offsets = {
            {
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "TabLineSel",
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
