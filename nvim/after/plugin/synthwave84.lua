--<< SYNTHWAVE '84 >>--

--<< Protected call
local synthwave84_status, synthwave84 = pcall(require, "synthwave84")
if not synthwave84_status then
    return
end

--<< Settings
synthwave84.setup({
    glow = {
        error_msg = true,
        type2 = true,
        func = true,
        keyword = true,
        operator = false,
        buffer_current_target = true,
        buffer_visible_target = true,
        buffer_inactive_target = true,
    }
})
