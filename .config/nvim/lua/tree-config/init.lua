vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_add_trailing = 1
require'nvim-tree'.setup {
    auto_open = true,
    auto_close = true,
    view = {
        width = 30,
    }
}
vim.cmd('nnoremap <leader>f :NvimTreeToggle<CR>')
