return require('packer').startup( {function()
    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'neovim/nvim-lspconfig'
    use 'preservim/nerdtree'
    use  'lambdalisue/suda.vim'
    use 'junegunn/fzf.vim'
    use 'jiangmiao/auto-pairs'
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    --use 'alvan/vim-closetag'
    use 'norcalli/nvim-colorizer.lua'
    use 'fladson/vim-kitty'
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    --use 'vim-airline/vim-airline'
    --use 'glepnir/dashboard-nvim'
    use 'Mofiqul/dracula.nvim'
    use 'overcache/NeoSolarized'
end,
config = {
    display = {
        open_fn = require('packer.util').float--({border = 'single'})
    }
},
run = ':TSUpdate',
})
