local function bootstrap_pckr()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not (vim.uv or vim.loop).fs_stat(pckr_path) then
        vim.fn.system({
            'git',
            'clone',
            "--filter=blob:none",
            'https://github.com/lewis6991/pckr.nvim',
            pckr_path
        })
    end

    vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

-- Pckr init
pckr = require('pckr')
pckr.setup{}

-- Loading packages
pckr.add {
    'nvim-tree/nvim-web-devicons',
    {
        'metalelf0/black-metal-theme-neovim',
        priority = 1000,
        config = function()
            require('plugins.config.black_metal')
        end
    },
    {
        'goolord/alpha-nvim',
        branch = 'main',
        config = function()
            require('plugins.config.alpha')()
        end
    }
}

pckr.add {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    run = function()
        require('nvim-treesitter.install').update { with_sync = true }
    end,
    config = function()
        require('plugins.config.treesitter')()
    end
}

pckr.add {
    {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins.config.telescope')
        end
    },
    'nvim-telescope/telescope-file-browser.nvim',
    {
        'stevearc/oil.nvim',
        config = function()
            require('plugins.config.oil')
        end
    },
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        config = function()
            require('plugins.config.harpoon')
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require ('plugins.config.lualine')
        end
    },
    {
        'mason-org/mason.nvim',
        config = function()
            require('plugins.config.lsp.mason')()
        end
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            require('plugins.config.cmp')()
        end,
        requires = {
            'hrsh7th/cmp-nvim-lsp',                
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path', 
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip'
        }
    },
    {
        'mason-org/mason-lspconfig.nvim',
        config = function()
            require('plugins.config.lsp.lsp')()
        end,
        requires = { 'neovim/nvim-lspconfig' }
    },
}

