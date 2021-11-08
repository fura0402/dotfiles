local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        layout_config = {
            width = 0.87,
            preview_width = 0.6,
            prompt_position = "top",
        },
        sorting_strategy = "ascending",
        find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
        prompt_prefix = "  ",
        selection_caret = " ",
        entry_prefix = "  ",
        set_env = {['COLORTERM'] = 'truecolor'},  -- Default: nil
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
                ["<C-f>"] = actions.close,
            }
        }
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
require("telescope").load_extension("emoji")


vim.cmd([[
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
]])
