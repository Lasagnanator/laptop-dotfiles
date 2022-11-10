--<< SIGNATURE >>--

--<< Protected call
local signature_status, signature = pcall(require, "lsp_signature")
if not signature_status then
    return
end

--<< Settings
signature.setup({
    doc_lines            = 0,
    toggle_key           = "<C-0>",
    select_signature_key = "<A-n>", -- cycle to next signature, e.g. '<M-n>' function overloading
    move_cursor_key      = "<A-m>", -- imap, use nvim_set_current_win to move cursor between current win and floating
    max_height           = 5, -- max height of signature floating_window
    max_width            = 80, -- max_width of signature floating_window
    hint_enable          = false,
    hint_prefix          = "Hint: ",
    bind                 = true,
    handler_opts         = {
        border = "none",
    },
})
