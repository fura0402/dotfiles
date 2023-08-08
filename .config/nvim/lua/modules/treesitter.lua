local M = {}

function M.setup()
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
      'vimdoc',
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
        init_selection = 'gnn', -- set to `false` to disable one of the mappings
        node_incremental = '.',
        node_decremental = ',',
        scope_incremental = 'gic',
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
        include_surrounding_whitespace = false,
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
          [']]'] = '@function.outer',
          [']c'] = { query = '@class.outer', desc = 'Next class start' },
        },
        goto_previous_start = {
          ['[['] = '@function.outer',
          ['[c'] = '@class.outer',
        },
        goto_next_end = {
          [']}'] = '@function.outer',
          [']C'] = '@class.outer',
        },
        goto_previous_end = {
          ['[{'] = '@function.outer',
          ['[C'] = '@class.outer',
        },
      },
    },
  })
end

function M.context_setup()
  require('treesitter-context').setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 1, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 15, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
  })
end

return M
