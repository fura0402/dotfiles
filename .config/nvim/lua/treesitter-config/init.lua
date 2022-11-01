require'nvim-treesitter.configs'.setup {
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
        'help',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'llvm',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'rust',
        'scss',
        'swift',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'yaml',
    },
    highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
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
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
}
