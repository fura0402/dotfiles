vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 0

vim.treesitter.language.register('markdown', 'mdx')

local ft = require('Comment.ft')
ft.mdx = '{/* %s */}'
