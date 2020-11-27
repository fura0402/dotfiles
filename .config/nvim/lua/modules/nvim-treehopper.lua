require('tsht').config.hintkeys = { 'h', 'j', 'f', 'd', 'n', 'v', 's', 'l', 'a' }

vim.keymap.set('n', 'gnf', ':<C-U>lua require("tsht").nodes()<CR>', { noremap = true, silent = true })
vim.keymap.set('o', 'gnf', ':<C-U>lua require("tsht").nodes()<CR>', { noremap = true, silent = true })
vim.keymap.set('x', 'gnf', ':lua require("tsht").nodes()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', 'T', ':lua require("tsht").move({ side = "start" })<CR>', { noremap = true, silent = true })
