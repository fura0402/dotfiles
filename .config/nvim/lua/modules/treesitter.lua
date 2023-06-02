require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'bash',
    'c',
    'cmake',
    'cpp',
    'css',
    'dockerfile',
    'gitignore',
    'go',
    'gomod',
    'gowork',
    -- 'help',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'llvm',
    'lua',
    'make',
    -- 'markdown',
    'markdown_inline',
    'python',
    'rust',
    -- 'scss',
    -- 'swift',
    'toml',
    'tsx',
    'typescript',
    'vim',
    'yaml',
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      --init_selection = "gnn", -- set to `false` to disable one of the mappings
      node_incremental = 'gin',
      scope_incremental = 'gic',
      node_decremental = 'gim',
    },
  },
  indent = {
    enable = false,
  },
  autotag = {
    enable = true,
  },
  matchup = {
    enable = true,
  },
  rainbow = {
    enable = true,
    strategy = 'global',
    query = {
      'rainbow-parens',
      html = 'rainbow-tags',
      javascript = 'rainbow-tags-react',
      tsx = 'rainbow-tags',
    },
  },
  context_commenting = {
    enable = true,
    enable_autocmd = false,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',

        ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = true,
    },
    swap = {
      enable = true,
      swap_next = {
        ['<Leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<Leader>i'] = '@parameter.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = { query = '@class.outer', desc = 'Next class start' },
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
  textsubjects = {
    enable = true,
    prev_selection = ',',
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-inner',
      ['a;'] = 'textsubjects-container-outer',
    },
  },
})
