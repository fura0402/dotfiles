vim.cmd ([[
noremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
]])

vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }

map('n', '==', 'gg=G <C-o>zz', opts)

map('', '<C-h>', '<C-w>h', opts)
map('', '<C-j>', '<C-w>j', opts)
map('', '<C-k>', '<C-w>k', opts)
map('', '<C-l>', '<C-w>l', opts)

map('n', '<C-o>', '<C-o>zz', opts)
map('n', '<C-i>', '<C-i>zz', opts)
map('n', "''", "''zz", opts)

map('n', 'd>', 'dd>>', opts)
map('n', 'd<', 'dd<<', opts)

map('n', 'x', '"_x', opts)
map('n', 's', '"_s', opts)
map('v', 'p', '"0p', opts)

map('i', '<C-f>', '<Esc>', opts)
map('v', '<C-f>', '<Esc>', opts)
map('c', '<C-f>', '<Esc>', opts)

map('i', '<C-h>', '<BS>', opts)
map('i', '<C-d>', '<Del>', opts)

map('i', '<C-l>', '<right>', opts)
