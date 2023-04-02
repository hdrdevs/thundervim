vim.cmd [[packadd packer.nvim]]

--run nvim with this command at the first timne
--nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    --Theme/Colorscheme Oxocarbon
    use { 'nyoom-engineering/oxocarbon.nvim' }

    use 'folke/tokyonight.nvim'
    use 'jacoborus/tender.vim'
    use "savq/melange-nvim"
    use 'AlexvZyl/nordic.nvim'
    use "lunarvim/Onedarker.nvim"
    use 'morhetz/gruvbox'
    use 'Mofiqul/dracula.nvim'

    --Telescope
    --Dependency: sudo dnf install ripgrep
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {
            { 'nvim-lua/plenary.nvim' }
        }
    }
    --PROJECTS
    -- Lua
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    --Treesitter
    --Dependency: sudo dnf install gcc gcc-c++
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    --LSP-ZERP
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
        }
    }

    -- Color Parenthesis Rainbow
    use("mrjones2014/nvim-ts-rainbow")

    --Tab lines
    use "lukas-reineke/indent-blankline.nvim"

    --Status Line
    use 'nvim-tree/nvim-web-devicons'
    use 'freddiehaddad/feline.nvim'

    --AutoPairs
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    --Colorizer
    use 'NvChad/nvim-colorizer.lua'

    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }

    -- Iconos en el autocompletado
    use "onsails/lspkind.nvim"

    --UI Component Library for Neovim
    use "MunifTanjim/nui.nvim"
    use 'anuvyklack/hydra.nvim'
    use 'rcarriga/nvim-notify'

    --Dashboards
    use {
        "startup-nvim/startup.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require "startup".setup({ theme = "evil" })
        end
    }

    --UNDOO
    use 'mbbill/undotree'
    --MARKS
    use { 'chentoast/marks.nvim',
        config = function()
            require 'marks'.setup({
                mappings = {
                    toggle = "m;",
                    delete_line = "dm-",
                    delete_buf = "dma",
                    prev = false -- pass false to disable only this default mapping
                }
            })
        end
    }

    --WICH KEYS
    -- Lua
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
                plugins = {},
                ignore_missing = true,
            }
        end
    }

    --FILE EXPLORER
    use "nvim-tree/nvim-tree.lua"

    --VIM FUGITIVE
    use "tpope/vim-fugitive"

    --TABS
    use({
        'willothy/nvim-cokeline',
        requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
        config = function()
            require('cokeline').setup()
        end
    })
end)
