vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_add_trailing = 1
require'nvim-tree'.setup {
    disable_netrw = true,
    hijack_netrw = false,
    auto_open = true,
    auto_close = true,
    view = {
        width = 30,
    }
}

local map = vim.api.nvim_set_keymap
map('n', '<leader>f', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
