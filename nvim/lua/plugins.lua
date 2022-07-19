return require('packer').startup( {function()
	use 'wbthomason/packer.nvim'
	use 'Mofiqul/dracula.nvim'
end,
config = {
	display = {
		open_fn = require('packer.util').float
	}
}
})
