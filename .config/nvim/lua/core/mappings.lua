vim.cmd ([[
noremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
]])

vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

map('n', '==', 'gg=G <C-o>zz', { noremap = true, silent = true })

map('', '<C-h>', '<C-w>h', { noremap = true, silent = false })
map('', '<C-j>', '<C-w>j', { noremap = true, silent = false })
map('', '<C-k>', '<C-w>k', { noremap = true, silent = false })
map('', '<C-l>', '<C-w>l', { noremap = true, silent = false })

map('n', '<C-o>', '<C-o>zz', { noremap = true, silent = false })
map('n', '<C-i>', '<C-i>zz', { noremap = true, silent = false })
map('n', "''", "''zz", { noremap = true, silent = true })

map('n', 'x', '"_x', { noremap = true, silent = false })
map('n', 's', '"_s', { noremap = true, silent = false })

map('i', '<C-f>', '<Esc>', { noremap = true, silent = false })
map('v', '<C-f>', '<Esc>', { noremap = true, silent = false })
map('c', '<C-f>', '<Esc>', { noremap = true, silent = false })

map('i', '<C-h>', '<BS>', { noremap = true, silent = false })
map('i', '<C-d>', '<Del>', { noremap = true, silent = false })

map('i', '<C-l>', '<right>', { noremap = false, silent = false })
