return require('packer').startup( {function()
	use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'neovim/nvim-lspconfig'
    use 'preservim/nerdtree'
    --use 'junegunn/fzf.vim'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    --use 'alvan/vim-closetag'
    use 'fladson/vim-kitty'
    use 'vim-airline/vim-airline'
    --use 'glepnir/dashboard-nvim'
	use 'Mofiqul/dracula.nvim'
end,
config = {
	display = {
        open_fn = require('packer.util').float--({border = 'single'})
	}
},
run = ':TSUpdate',
})
