local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

-- install packer if needed
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
    vim.cmd [[packadd packer.nvim]]
end


require('packer').init({
    -- ~/.local/share/nvim/site/pack/packer/start/packer.nvim/packer_compiled.lua
    compile_path = install_path .. '/packer_compiled.lua',
})

vim.cmd([[
augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile profile=true
augroup end
]])


return require('packer').startup({function(use)
    use 'wbthomason/packer.nvim'

    use 'nvim-lua/plenary.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    }

    use 'cocopon/iceberg.vim'
    use 'shaunsingh/nord.nvim'
    use {
        'svrana/neosolarized.nvim',
        requires = { 'tjdevries/colorbuddy.nvim' }
    }

    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup {
                override = {}, default = true
            }
        end
    }

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use 'glepnir/lspsaga.nvim'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'

    use 'windwp/nvim-autopairs'
    use 'windwp/nvim-ts-autotag'
    use 'tpope/vim-surround'
    use 'andymass/vim-matchup'
    use 'p00f/nvim-ts-rainbow'

    use 'nvim-lualine/lualine.nvim'
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use 'lukas-reineke/indent-blankline.nvim'


    use 'kyazdani42/nvim-tree.lua'

    use 'nvim-telescope/telescope.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {'nvim-telescope/telescope-symbols.nvim'}
    use {'jvgrootveld/telescope-zoxide'}
    use {
        'AckslD/nvim-neoclip.lua',
        requires = {
            {'nvim-telescope/telescope.nvim'},
        },
    }

    --use {
    --    'lewis6991/gitsigns.nvim',
    --    -- tag = 'release' -- To use the latest release
    --}

    use 'norcalli/nvim-colorizer.lua'
    use 'andweeb/presence.nvim'
end,
config = {
    display = {
        open_fn = function()
            return require('packer.util').float({ border = 'single' })
        end
    }
}})
