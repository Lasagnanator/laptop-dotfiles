--<< PLUGINS AND PACKER >>--

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup({

    function(use)
        --<< Packer
        use "wbthomason/packer.nvim" -- Plugin manager

        --<< Highlighting
        use "nvim-treesitter/nvim-treesitter" -- Syntax highlighting
        use { "nvim-treesitter/playground", -- Treesitter informations in Neovim
            requires = "nvim-treesitter/nvim-treesitter",
        }
        use "folke/lsp-colors.nvim" -- Fills in the colors missing from TS servers

        --<< LSP and diagnostics
        use "williamboman/mason.nvim" -- Automate installation of LSP servers
        use "williamboman/mason-lspconfig.nvim" -- Bridges the two plugins
        use "neovim/nvim-lspconfig" -- Defaults for LSP
        use "ray-x/lsp_signature.nvim"
        use { "folke/trouble.nvim", -- List of diagnostics
            requires = "kyazdani42/nvim-web-devicons",
        }

        --<< Navigation
        use { "nvim-tree/nvim-tree.lua", -- File navigation
            requires = "kyazdani42/nvim-web-devicons",
        }
        use { "nvim-telescope/telescope.nvim", -- File finder with many filters
            requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
        }
        use { "nvim-telescope/telescope-fzf-native.nvim", -- fzf integration for Telescope
            run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        }

        --<< Completion
        use { "hrsh7th/nvim-cmp", -- Completion plugin
            requires = "kyazdani42/nvim-web-devicons",
        }
        use "hrsh7th/cmp-nvim-lsp" -- Completion integration with LSP
        use "hrsh7th/cmp-buffer" -- Completion for buffer
        use "hrsh7th/cmp-path" -- Completion for paths
        use "hrsh7th/cmp-cmdline" -- Completion for command line
        use "kdheepak/cmp-latex-symbols" -- Completion for LaTeX symbols
        use "chrisgrieser/cmp-nerdfont" -- Completion for Nerd Fonts characters
        use "hrsh7th/cmp-emoji" -- Completion for emojis
        use "petertriho/cmp-git" -- Completion for git informations
        use "saadparwaiz1/cmp_luasnip" -- Luasnip integration

        --<< Snippets
        use "L3MON4D3/LuaSnip" -- Snippet engine
        use "rafamadriz/friendly-snippets" -- Additional snippets

        --<< Comments
        use "numToStr/Comment.nvim" -- Easier commenting

        --<< Git
        use "tpope/vim-fugitive" -- Git tools inside neovim

        --<< Pairs and brackets
        use "jiangmiao/auto-pairs" -- Generate final bracket automatically
        use "tpope/vim-surround" -- Manipulate brackets and other delimiters
        use "tpope/vim-repeat" -- More advanced repeating with dot
        use { "alvan/vim-closetag", -- Manipulate html tags
            ft = { "html", "xhtml", "phtml", "markdown" }
        }

        --<< Utilities
        use "lambdalisue/suda.vim" -- Edit with su permission maintaining personal configuration
        use "norcalli/nvim-colorizer.lua" -- Colorful hex codes
        use "b0o/schemastore.nvim" -- JSON schemas downloader for JSON LSP
        use "fladson/vim-kitty" -- Kitty.conf file syntax highlighting

        --<< Theming and customizing
        use { "nvim-lualine/lualine.nvim", -- Custom statusline written in Lua
            requires = { "kyazdani42/nvim-web-devicons" }, -- Custom icons for neovim
        }
        use "Mofiqul/dracula.nvim" -- Dracula Neovim theme
        use "folke/tokyonight.nvim" -- Tokyonight Neovim theme
        use "lunarvim/synthwave84.nvim" -- Synthwave '84 Neovim theme

        --<< Deactivated
        -- use "glepnir/dashboard-nvim" -- Customize the opening screen
        -- use "hrsh7th/cmp-emoji" -- Completion for emojis
        -- use "kristijanhusak/vim-dadbod-completion" -- Completion for database interactions
        -- use "epwalsh/obsidian.nvim" -- Write and Navigate Obsidian vaults
        -- use "preservim/tagbar" -- Open a list of components on the side
        -- use "frioux/vim-lost" -- Plugin to check, not sure if useful
        -- use "ray-x/navigator.lua" -- Makes code easier to navigate


        -- Run PackerSync if bootstrapped
        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "none" })
            end
        }
    },
})
