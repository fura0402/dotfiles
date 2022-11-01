vim.cmd ([[
noremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
]])
vim.g.mapleader = " "

local opts = { noremap=true, silent=true }

vim.keymap.set('n', '==', 'gg=G <C-o>zz', opts)

vim.keymap.set('n', 'j', 'gj', opts)
vim.keymap.set('n', 'k', 'gk', opts)

vim.keymap.set('n', '<C-o>', '<C-o>zz', opts)
vim.keymap.set('n', '<C-i>', '<C-i>zz', opts)
vim.keymap.set('n', "''", "''zz", opts)

vim.keymap.set('n', 'd>', 'dd>>', opts)
vim.keymap.set('n', 'd<', 'dd<<', opts)

vim.keymap.set('n', 'x', '"_x', opts)
vim.keymap.set('n', 's', '"_s', opts)
vim.keymap.set('v', 'p', '"0p', opts)

vim.keymap.set('i', '<C-f>', '<Esc>', opts)
vim.keymap.set('v', '<C-f>', '<Esc>', opts)
--vim.keymap.set('c', '<C-f>', '<Esc>', opts)

vim.keymap.set('i', '<C-h>', '<BS>', opts)
vim.keymap.set('i', '<C-d>', '<Del>', opts)

vim.keymap.set('i', '<C-l>', '<right>', opts)
