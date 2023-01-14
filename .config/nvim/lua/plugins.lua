local fn = vim.fn
local data_dir = fn.stdpath('data') .. '/site/'
local install_path = data_dir .. 'pack/packer/opt/packer.nvim'
local packer_compiled = data_dir .. 'lua/_compiled.lua'


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
end

local packer = nil
local function init()
  if not packer then
    vim.cmd.packadd('packer.nvim')
    packer = require('packer')
    packer.init({
      compile_path = packer_compiled,
      display = {
        open_fn = function()
          return require('packer.util').float({ border = 'single' })
        end,
      },
    })
  end
  packer.reset()

  local use = packer.use

  use { 'wbthomason/packer.nvim', opt = true }
  use { 'lewis6991/impatient.nvim', config = 'require("impatient")' }
  use { 'nathom/filetype.nvim' }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
      { 'RRethy/nvim-treesitter-textsubjects', after = 'nvim-treesitter' },
      { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
    },
    run = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile', 'InsertEnter' },
    config = 'require("modules.treesitter")'
  }

  use { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }
  use { 'p00f/nvim-ts-rainbow', after = 'nvim-treesitter' }
  use { 'haringsrob/nvim_context_vt', after = 'nvim-treesitter', config = 'require("modules.context_vt")' }
  use { 'andymass/vim-matchup', after = 'nvim-treesitter' }

  use {
    'numToStr/Comment.nvim',
    after = 'nvim-ts-context-commentstring',
    config = 'require("modules.comment")',
  }

  use {
    'lukas-reineke/indent-blankline.nvim',
    after = 'nvim-treesitter',
    event = 'BufRead',
    config = 'require("modules.indent-blankline")',
  }

  use {
    'cocopon/iceberg.vim',
    opt = true,
  }
  use {
    'shaunsingh/nord.nvim',
    opt = true,
  }
  use {
    'svrana/neosolarized.nvim',
    requires = { 'tjdevries/colorbuddy.nvim', opt = true },
    opt = true,
  }
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    opt = true,
  }

  use {
    'williamboman/mason.nvim',
    requires = {
      { 'williamboman/mason-lspconfig.nvim', config = 'require("modules.lsp.mason").lspconfig()', },
      { 'jay-babu/mason-null-ls.nvim', after = 'null-ls.nvim', config = 'require("modules.lsp.mason").null_ls()' },
    },
    config = 'require("modules.lsp.mason").setup()',
  }

  use { 'neovim/nvim-lspconfig', event = 'BufReadPre', config = 'require("modules.lsp.lspconfig")' }
  use {
    'glepnir/lspsaga.nvim',
    after = 'nvim-lspconfig',
    commit = 'b7b4777369b441341b2dcd45c738ea4167c11c9e',
    config = 'require("modules.lsp.lspsaga")'
  }
  use { 'ray-x/lsp_signature.nvim', after = 'nvim-lspconfig' }
  use {
    'folke/trouble.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
    after = 'nvim-lspconfig',
    cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
    config = 'require("modules.lsp.trouble")',
  }
  use {
    'j-hui/fidget.nvim',
    after = 'nvim-lspconfig',
    event = 'BufReadPost',
    config = function()
      require('fidget').setup({
        text = {
          spinner = 'line',
        },
        timer = {
          fidget_decay = 3000,
          task_decay = 500,
        },
      })
    end,
  }
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'nvim-lua/plenary.nvim', module = 'plenary' },
    after = 'nvim-lspconfig',
    config = 'require("modules.lsp.null-ls")',
  }
  use {
    'simrat39/rust-tools.nvim',
    requires = { 'nvim-lua/plenary.nvim', module = 'plenary' },
    ft = 'rust',
    config = 'require("modules.lsp.lspconfig").rust_setup()',
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'onsails/lspkind-nvim', module = 'lspkind', config = 'require("modules.lsp.lspkind")' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp', after = 'cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' }
    },
    wants = 'LuaSnip',
    event = 'InsertEnter',
    config = 'require("modules.lsp.cmp")',
  }
  use {
    'L3MON4D3/LuaSnip',
    after = 'nvim-cmp',
    config = 'require("modules.lsp.luasnip")',
  }

  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = 'require("modules.autopairs")',
  }

  use {
    'kylechui/nvim-surround',
    event = 'BufWinEnter',
    config = 'require("nvim-surround").setup()',
  }
  use {
    'phaazon/hop.nvim',
    event = 'BufWinEnter',
    config = 'require("modules.hop")'
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = 'nvim-tree/nvim-web-devicons',
  }
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'nvim-tree/nvim-web-devicons',
    config = 'require("modules.bufferline").set_map()',
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons',
    cmd = 'NvimTreeFindFileToggle',
    setup = function ()
      vim.keymap.set('n', '<leader>f', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
    end,
    config = 'require("modules.nvim-tree")',
  }
  use {
    'nvim-telescope/telescope.nvim',
    module = 'telescope',
    requires = {
      { 'nvim-lua/plenary.nvim', opt = true },
      { 'nvim-telescope/telescope-fzf-native.nvim', opt = true, run = 'make' },
      { 'nvim-telescope/telescope-symbols.nvim', opt = true },
      { 'jvgrootveld/telescope-zoxide', opt = true },
      { 'ahmedkhalf/project.nvim', opt = true, config = 'require("project_nvim").setup()' }
    },
    wants = {
      'plenary.nvim',
      'telescope-fzf-native.nvim',
      'telescope-symbols.nvim',
      'telescope-zoxide',
      'project.nvim',
    },
    setup = function ()
      local function builtin(name)
        return function(opt)
          return function()
            return require("telescope.builtin")[name](opt or {})
          end
        end
      end
      local function extensions(name , prop)
        return function (opt)
          return function ()
            local telescope = require('telescope')
            telescope.load_extension(name)
            return telescope.extensions[name][prop](opt or {})
          end
        end
      end

      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<Leader>tf', builtin 'find_files' {}, opts)
      vim.keymap.set('n', '<Leader>tg', builtin 'live_grep' {}, opts)
      vim.keymap.set('n', '<Leader>to', builtin 'oldfiles' {}, opts)
      vim.keymap.set('n', '<Leader>tb', builtin 'buffers' {}, opts)
      vim.keymap.set('n', '<Leader>th', builtin 'help_tags' {}, opts)
      vim.keymap.set('n', '<Leader>tp', extensions('projects', 'projects') {}, opts)
      vim.keymap.set('n', '<Leader>tc', extensions('neoclip', 'default') {}, opts)
      vim.keymap.set('n', '<Leader>cd', extensions('zoxide', 'list') {}, opts)
      vim.keymap.set('n', '<Leader>ge', builtin 'symbols' { sources = {"emoji"} }, opts)
      vim.keymap.set('i', '<C-g>e',     builtin 'symbols' { sources = {"emoji"} }, opts)
      vim.keymap.set('n', '<Leader>gi', builtin 'symbols' { sources = {"gitmoji"} }, opts)
      vim.keymap.set('i', '<C-g>i',     builtin 'symbols' { sources = {"gitmoji"} }, opts)
    end,
    config = 'require("modules.telescope")',
  }
  use { 'AckslD/nvim-neoclip.lua', after = 'telescope.nvim', config = 'require("modules.telescope.neoclip")' }

  use { 'jghauser/mkdir.nvim' }

  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim', opt = true },
    wants = { 'plenary.nvim' },
    event = { 'BufReadPost', 'BufNewFile' },
    config = 'require("modules.gitsigns")',
  }

  use {
    'norcalli/nvim-colorizer.lua',
    event = 'BufWinEnter',
    config = 'require("modules.colorizer")'
  }

  use {
    'folke/zen-mode.nvim',
    requires = {
      { 'folke/twilight.nvim', opt = true },
    },
    wants = { 'twilight.nvim' },
    cmd = 'ZenMode',
    setup = function ()
      vim.api.nvim_create_user_command("ZenMode", function ()
        vim.cmd([[ZenMode]])
      end, {})
    end,
    config = 'require("zen-mode").setup()',
  }

  use {
    'dstein64/vim-startuptime',
    cmd = 'StartupTime',
    setup = function ()
      vim.api.nvim_create_user_command("StartupTime", function ()
        vim.cmd([[StartupTime]])
      end, {})
    end,
  }
end

local plugins = setmetatable({}, {
  __index = function (_, key)
    if not packer then
      init()
    end
    return packer[key]
  end,
})

-- Commands
function plugins.load_compile()
  if vim.fn.filereadable(packer_compiled) == 1 then
    require('_compiled')
  else
    plugins.compile()
  end

  local cmds = {
    Install = { desc = '[Packer] Install plugins', force = true },
    Update = { desc = '[Packer] Update plugins', force = true },
    Clean = { desc = '[Packer] Clean plugins', force = true },
    Status = { desc = '[Packer] Output plugins status', force = true },
    Compile = { desc = '[Packer] Output plugins status', force = true },
    Sync = { desc = '[Packer] Update plugins', force = true },
  } 

  for cmd, opts in pairs(cmds) do
    vim.api.nvim_create_user_command('Packer' .. cmd, function ()
      vim.cmd.packadd('packer.nvim')
      require('plugins')[string.lower(cmd)]()
    end, opts)
  end
end
 

return plugins
