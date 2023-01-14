vim.cmd([[
  noremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
]])
vim.g.mapleader = ' '

local key_set = vim.keymap.set
local key_del = vim.keymap.del
local opts = { noremap = true, silent = true }

key_set('n', '==', 'gg=G <C-o>zz', opts)

key_set('n', 'j', 'gj', opts)
key_set('n', 'k', 'gk', opts)

key_set('n', '<C-o>', '<C-o>zz', opts)
key_set('n', '<C-i>', '<C-i>zz', opts)
key_set('n', "''", "''zz", opts)

key_set('n', 'x', '"_x', opts)
key_set('n', 's', '"_s', opts)
key_set('v', 'p', '"0p', opts)

key_set('i', '<C-f>', '<Esc>', opts)
key_set('v', '<C-f>', '<Esc>', opts)
--key_set('c', '<C-f>', '<Esc>', opts)

key_set('i', '<C-h>', '<BS>', opts)
key_set('i', '<C-d>', '<Del>', opts)

key_set('i', '<C-l>', '<right>', opts)
key_set('i', '<C-b>', '<left>', opts)

key_set('i', '<C-t>', '<Nop>', opts)
key_set('i', '<C-g>', '<Nop>', opts) -- not working?
key_set('i', '<C-q>', '<Nop>', opts)
