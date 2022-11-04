local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
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
        use { "nvim-treesitter/nvim-treesitter", -- Syntax highlighting
            -- config = function() require("user.configs.treesitter") end,
        }
        use { "nvim-treesitter/playground", -- Treesitter informations in Neovim
            requires = "nvim-treesitter/nvim-treesitter",
        }
        use "folke/lsp-colors.nvim" -- Fills in the colors missing from TS servers

        --<< LSP and diagnostics
        use { "williamboman/mason.nvim", -- Automate installation of LSP servers
            -- config = function() require("user.configs.mason") end,
        }
        use { "williamboman/mason-lspconfig.nvim", -- Bridges the two plugins
            -- config = function() require("user.configs.mason-lspconfig") end,
        }
        use "neovim/nvim-lspconfig" -- Defaults for LSP
        use { "folke/trouble.nvim", -- List of diagnostics
            requires = "kyazdani42/nvim-web-devicons",
            -- config = function() require("trouble").setup() end,
        }

        --<< Navigation
        use "preservim/nerdtree" -- Nerdtree file navigation

        --<< Completion
        use { "hrsh7th/nvim-cmp", -- Completion plugin
            requires = "kyazdani42/nvim-web-devicons",
            -- config = function() require("user.configs.cmp") end,
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

        --<< Comments
        use { "numToStr/Comment.nvim", -- Easier commenting
            -- config = function() require("user.configs.comment") end,
        }

        --<< Snippets
        use { "L3MON4D3/LuaSnip", -- Snippet engine
            -- config = function() require("luasnip.loaders.from_vscode").lazy_load() end
        }
        use "rafamadriz/friendly-snippets" -- Additional snippets

        --<< Git
        use "tpope/vim-fugitive" -- Git tools inside neovim

        --<< Pairs and brackets
        use "jiangmiao/auto-pairs" -- Generate final bracket automatically
        use "tpope/vim-surround" -- Manipulate brackets and other delimiters
        use "tpope/vim-repeat" -- More advanced repeating with dot
        use { "alvan/vim-closetag", -- Manipulate html tags
            ft = { "html" }
        }

        --<< Utilities
        use { "lambdalisue/suda.vim", -- Edit with su permission maintaining personal configuration
            -- config = function() require("user.configs.suda") end,
        }
        use { "norcalli/nvim-colorizer.lua", -- Colorful hex codes
            -- config = function() require("user.configs.colorizer") end,
        }
        use "b0o/schemastore.nvim" -- JSON schemas downloader for JSON LSP
        use "fladson/vim-kitty" -- Kitty.conf file syntax highlighting

        --<< Theming and customizing
        use { "nvim-lualine/lualine.nvim", -- Custom statusline written in Lua
            requires = { "kyazdani42/nvim-web-devicons" }, -- Custom icons for neovim
            -- config = function() require("user.configs.lualine") end,
        }
        use { "Mofiqul/dracula.nvim", -- Dracula Neovim theme
            -- config = function() require("user.configs.dracula") end,
        }
        use { "folke/tokyonight.nvim", -- Tokyonight Neovim theme
            -- config = function() require("user.configs.tokyonight") end,
        }
        use { "lunarvim/synthwave84.nvim", -- Synthwave '84 Neovim theme
            -- config = function() require("user.configs.synthwave84") end,
        }

        --<< Deactivated
        -- use "glepnir/dashboard-nvim"                        -- Customize the opening screen
        -- use "hrsh7th/cmp-emoji"                             -- Completion for emojis

        -- Run PackerSync if bootstrapped
        if packer_bootstrap then
            require("packer").sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({border = "none"})
            end
        }
    },
})
