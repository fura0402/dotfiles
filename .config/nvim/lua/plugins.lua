return {
  {
    'nathom/filetype.nvim',
    lazy = false,
    config = function()
      vim.g.did_load_filetypes = 1
      require('filetype').setup({
        overrides = {
          extensions = {
            c = 'c',
          },
        },
      })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'windwp/nvim-ts-autotag',
      {
        'HiPhish/rainbow-delimiters.nvim',
        config = function()
          require('modules.rainbow-delimiters')
        end,
      },
      'andymass/vim-matchup',
      {
        'haringsrob/nvim_context_vt',
        config = function()
          require('modules.context_vt')
        end,
      },
      {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
          require('modules.indent-blankline')
        end,
      },
    },
    build = ':TSUpdate',
    event = { 'BufRead', 'BufNewFile' },
    config = function()
      require('modules.treesitter')
    end,
  },

  {
    'numToStr/Comment.nvim',
    dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
    event = { 'VeryLazy' },
    config = function()
      require('modules.comment')
    end,
  },

  {
    'cocopon/iceberg.vim',
    ft = { 'markdown', 'rust', 'toml', 'go' },
  },
  {
    'shaunsingh/nord.nvim',
    dependencies = { 'lukas-reineke/headlines.nvim' },
  },
  {
    'svrana/neosolarized.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim' },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        config = function()
          require('modules.lsp.mason').setup()
        end,
        build = ':MasonUpdate',
      },
      {
        'williamboman/mason-lspconfig.nvim',
        config = function()
          require('modules.lsp.mason').lspconfig()
        end,
      },
      'ray-x/lsp_signature.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('modules.lsp.lspconfig')
    end,
  },

  {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      require('modules.lsp.mason').null_ls()
    end,
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'jay-babu/mason-null-ls.nvim' },
    event = 'LspAttach',
    config = function()
      require('modules.lsp.null-ls')
    end,
  },

  {
    'glepnir/lspsaga.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'nvim-treesitter/nvim-treesitter',
    },
    event = 'LspAttach',
    config = function()
      require('modules.lsp.lspsaga')
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    config = function()
      require('modules.lsp.trouble')
    end,
  },
  {
    'j-hui/fidget.nvim',
    dependencies = 'nvim-lspconfig',
    event = 'LspAttach',
    config = function()
      require('fidget').setup({
        text = {
          spinner = 'line',
        },
        timer = {
          fidget_decay = 3000,
          task_decay = 500,
        },
        window = {
          blend = 100,
        },
      })
    end,
    tag = 'legacy',
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    ft = 'rust',
    config = function()
      require('modules.lsp.lspconfig').rust_setup()
    end,
  },

  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('modules.lsp.luasnip')
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {
        'onsails/lspkind.nvim',
        config = function()
          require('modules.lsp.lspkind')
        end,
      },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },
    },
    event = 'InsertEnter',
    config = function()
      require('modules.lsp.cmp')
    end,
  },

  {
    'windwp/nvim-autopairs',
    dependencies = { 'nvim-cmp' },
    event = 'InsertEnter',
    config = function()
      require('modules.autopairs')
    end,
  },

  {
    'kylechui/nvim-surround',
    event = 'BufWinEnter',
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'phaazon/hop.nvim',
    event = 'BufWinEnter',
    config = function()
      require('modules.hop')
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },
  {
    'akinsho/bufferline.nvim',
    version = 'v2.*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      require('modules.bufferline').set_map()
    end,
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = 'NvimTreeFindFileToggle',
    init = function()
      vim.keymap.set('n', '<leader>f', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
    end,
    config = function()
      require('modules.nvim-tree')
    end,
  },

  {
    'AckslD/nvim-neoclip.lua',
    config = function()
      require('modules.telescope.neoclip')
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      { 'nvim-telescope/telescope-symbols.nvim' },
      { 'jvgrootveld/telescope-zoxide' },
      {
        'ahmedkhalf/project.nvim',
        config = function()
          require('project_nvim').setup({
            manual_mode = true,
          })
        end,
      },
    },
    init = function()
      local function builtin(name)
        return function(opt)
          return function()
            return require('telescope.builtin')[name](opt or {})
          end
        end
      end
      local function extensions(name, prop)
        return function(opt)
          return function()
            local telescope = require('telescope')
            telescope.load_extension(name)
            return telescope.extensions[name][prop](opt or {})
          end
        end
      end

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<Leader>tf', builtin('find_files')({}), opts)
      vim.keymap.set('n', '<Leader>tg', builtin('live_grep')({}), opts)
      vim.keymap.set('n', '<Leader>to', builtin('oldfiles')({}), opts)
      vim.keymap.set('n', '<Leader>tb', builtin('buffers')({}), opts)
      vim.keymap.set('n', '<Leader>th', builtin('help_tags')({}), opts)
      vim.keymap.set('n', '<Leader>tp', extensions('projects', 'projects')({}), opts)
      vim.keymap.set('n', '<Leader>tc', extensions('neoclip', 'default')({}), opts)
      vim.keymap.set('n', '<Leader>cd', extensions('zoxide', 'list')({}), opts)
      vim.keymap.set('n', '<Leader>ge', builtin('symbols')({ sources = { 'emoji' } }), opts)
      vim.keymap.set('i', '<C-g>e', builtin('symbols')({ sources = { 'emoji' } }), opts)
      vim.keymap.set('n', '<Leader>gi', builtin('symbols')({ sources = { 'gitmoji' } }), opts)
      vim.keymap.set('i', '<C-g>i', builtin('symbols')({ sources = { 'gitmoji' } }), opts)
    end,
    config = function()
      require('modules.telescope')
    end,
  },

  {
    'jghauser/mkdir.nvim',
    event = 'CmdlineEnter',
  },

  {
    'lewis6991/gitsigns.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('modules.gitsigns')
    end,
  },

  {
    'norcalli/nvim-colorizer.lua',
    event = 'BufWinEnter',
    config = function()
      require('modules.colorizer')
    end,
  },

  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    config = function()
      vim.g.mkdp_theme = 'light'
    end,
  },

  {
    'folke/zen-mode.nvim',
    dependencies = {
      { 'folke/twilight.nvim' },
    },
    cmd = 'ZenMode',
    config = function()
      require('zen-mode').setup()
    end,
  },

  {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
  },
}
