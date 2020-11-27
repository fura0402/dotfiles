local hop = require('hop')
hop.setup({
  -- keys = 'asdghklqwertyuiopzxcvbnmfj',
  keys = 'hjklyuiopbnm',
  quit_key = '<C-f>',
})

local directions = require('hop.hint').HintDirection

vim.keymap.set('n', 'f', function()
  hop.hint_words({ current_line_only = true })
end, { remap = true })

vim.keymap.set('n', 't', function()
  hop.hint_patterns()
end, { remap = true })
