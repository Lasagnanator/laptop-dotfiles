local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup( {function()

    --<< Packer
    use 'wbthomason/packer.nvim'            -- Plugin manager

    --<< Treesitter
    use 'nvim-treesitter/nvim-treesitter'   -- Syntax highlighting
    use 'nvim-treesitter/playground'        -- Treesitter informations in Neovim

    --<< Lsp
    use 'neovim/nvim-lspconfig'             -- Defaults for LSP

    --<< Navigation
    use 'preservim/nerdtree'                -- Nerdtree file navigation

    --<< Completion
    use 'hrsh7th/nvim-cmp'                  -- Completion plugin
    use 'hrsh7th/cmp-buffer'                -- Completion for buffer
    use 'hrsh7th/cmp-path'                  -- Completion for paths
    use 'hrsh7th/cmp-cmdline'               -- Completion for command line
    use 'saadparwaiz1/cmp_luasnip'          -- Luasnip integration

    --<< Snippets
    use "L3MON4D3/LuaSnip"                  -- Snippet engine
    use "rafamadriz/friendly-snippets"      -- Additional snippets

    --<< Git
    use 'tpope/vim-fugitive'                -- Git tools inside neovim

    --<< Pairs and brackets
    use 'jiangmiao/auto-pairs'              -- Generate final bracket automatically
    use 'tpope/vim-surround'                -- Manipulate brackets and other delimiters
    use 'tpope/vim-repeat'                  -- More advanced repeating with dot
    --use 'alvan/vim-closetag'              -- Manipulate html tags

    --<< Utilities
    use 'lambdalisue/suda.vim'              -- Edit with su permission maintaining personal configuration
    use 'norcalli/nvim-colorizer.lua'       -- Colorful hex codes
    use 'fladson/vim-kitty'                 -- Kitty conf file syntax highlighting

    --<< Theming and customizing
    use 'nvim-lualine/lualine.nvim'        -- Custom statusline written in Lua
    use 'kyazdani42/nvim-web-devicons'     -- Custom icons for neovim
    use 'Mofiqul/dracula.nvim'              -- Dracula Neovim theme

    --<< Deactivated
    --use 'glepnir/dashboard-nvim'
    --use {
    --    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    --    requires = {
    --        'nvim-lua/plenary.nvim',
    --        'kyazdani42/nvim-web-devicons',
    --    }
    --}  

end,
config = {
    display = {
        open_fn = require('packer.util').float--({border = 'single'})
    }
},
run = ':TSUpdate',
})
