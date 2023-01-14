local hop = require('hop')
hop.setup({
  quit_key = '<C-f>',
})

local directions = require('hop.hint').HintDirection
vim.keymap.set('n', 'f', function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('n', 'F', function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set('n', 't', function()
  hop.hint_patterns({ direction = directions.AFTER_CURSOR })
end, { remap = true })
vim.keymap.set('n', 'T', function()
  hop.hint_patterns({ direction = directions.BEFORE_CURSOR })
end, { remap = true })
