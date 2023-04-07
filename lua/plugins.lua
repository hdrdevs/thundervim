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
    --El TSUpdate da error. Intentar correrlo en otro momento.
    --use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use{
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- A list of parser names, or "all" (the five listed parsers should always be installed)
                ensure_installed = {
                    "lua",
                    "vim",
                    "javascript",
                    "typescript",
                    "html",
                    "bash",
                    "c",
                    "cpp",
                    "css",
                    "gitcommit", "gitignore",
                    "json",
                    "markdown",
                    "php",
                    "scss",
                    "sql",
                    "tsx",
                },
            
                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = true,
            
                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = true,
            
                -- List of parsers to ignore installing (for "all")
                --ignore_install = { "javascript" },
            
                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
            
                highlight = {
                    enable = true,
                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    -- disable = { "c", "rust" },
                    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
            
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
            
        end
        --, run = ":TSUpdate"
    }

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
    
     use {
        "mrjones2014/nvim-ts-rainbow", requires = {
	        {"nvim-treesitter/nvim-treesitter"},
        },config = function()
            require('nvim-treesitter.configs').setup({
               	highlight = {
                		-- ...
                	},
                	-- ...
                	rainbow = {
                		enable = true,
                		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
                		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
                		max_file_lines = nil, -- Do not enable for files with more than n lines, int
                		-- colors = {}, -- table of hex strings
                		-- termcolors = {} -- table of colour name strings
                	},
                })
            end
        
    } 

    --Tab lines
    use "lukas-reineke/indent-blankline.nvim"

    --Status Line
    use 'nvim-tree/nvim-web-devicons'
    --use 'freddiehaddad/feline.nvim'

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
        "hdrdevs/startup.nvim",
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

    --ROOT PROJECT
    use "airblade/vim-rooter"

    -- TABS
    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons', config = function() require("bufferline").setup{}  end}

    -- STATUS LINE
use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true, config = function() require("lualine").setup()  end }
}

    --OUTLINE - LSP
    use ({'simrat39/symbols-outline.nvim', config = function() require("symbols-outline").setup() end})

    --TERMINAL
    use {
        "NvChad/nvterm",
        config = function ()
            require("nvterm").setup()
        end,
    }

end)
