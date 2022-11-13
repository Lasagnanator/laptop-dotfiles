--<< DRESSING >>--

--<< Protected call
local dressing_status, dressing = pcall(require, "dressing")
if not dressing_status then
    return
end

--<< Setup
dressing.setup({})
