local settings = {
	number = true,
    relativenumber = true,
	cursorline = true,
	cursorlineopt = number,
	autoindent = true,
	expandtab = true,
	tabstop = 4,
	background = dark,
}

for k, v in pairs(settings) do
vim.opt[k] = v
end

--syntax on
--colorscheme dracula
--g:dracula_colorterm=0
