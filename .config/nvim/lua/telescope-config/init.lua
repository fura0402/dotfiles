local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        layout_config = {
            width = 0.8,
            preview_width = 0.5,
            prompt_position = "bottom",
        },
        winblend = 0;
        sorting_strategy = "descending",
        prompt_prefix = "  ",
        selection_caret = "  ",
        entry_prefix = "   ",
        set_env = {['COLORTERM'] = 'truecolor'},  -- Default: nil
        vimgrep_arguments = {
            'rg',
            '--hidden',
            '--follow',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
        },
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
                ["<C-f>"] = actions.close,
            },
        },
    },
    pickers = {
        find_files = {
            find_command = {
                'fd',
                '--type=file',
                '--hidden',
                '--follow',
                '--no-ignore',
                '--strip-cwd-prefix',
                '--exclude=.git',
                '--exclude=node_modules'
            },
        },
        registers = {
            theme = "cursor",
            layout_config = { height = 0.4, width = 0.2 },
        },
        symbols = {
            theme = "cursor",
            layout_config = { height = 0.5 },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        },
    }
}
require('telescope').load_extension('fzf')


local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
map('n', '<Leader>tf', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<Leader>tg', '<Cmd>Telescope live_grep<CR>', opts)
map('n', '<Leader>to', '<Cmd>Telescope oldfiles<CR>', opts)
map('n', '<Leader>tb', '<Cmd>Telescope buffers<CR>', opts)
map('n', '<Leader>th', '<Cmd>Telescope help_tags<CR>', opts)
map('n', '<Leader>te', '<Cmd>lua require"telescope.builtin".symbols{ sources = {"emoji"} }<CR>', opts)
map('n', '<Leader>tc', '<Cmd>lua require"telescope.builtin".symbols{ sources = {"gitmoji"} }<CR>', opts)
