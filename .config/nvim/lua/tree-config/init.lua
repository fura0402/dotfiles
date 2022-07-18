require'nvim-tree'.setup {
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_netrw = false,
    -- auto_open = true, // This option is removed.
    --auto_close = true, // This option is removed.
    view = {
        width = 30,
    },
    renderer = {
        add_trailing = true,
        highlight_git = true,
        highlight_opened_files = "none",
        indent_markers = { enable = true },
    },
    actions = { open_file = { quit_on_open = true }, },
}

local map = vim.api.nvim_set_keymap
map('n', '<leader>f', ':NvimTreeFindFileToggle<CR>', { noremap = true, silent = true })
