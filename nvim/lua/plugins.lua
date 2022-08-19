local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup( {function()
    use 'wbthomason/packer.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/playground'
    use 'neovim/nvim-lspconfig'
    use 'preservim/nerdtree'
    use 'lambdalisue/suda.vim'
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
