local rainbow_delimiters = require('rainbow-delimiters')

vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow_delimiters.strategy['global'],
    html = rainbow_delimiters.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    lua = 'rainbow-blocks',
    javascript = 'rainbow-delimiters-react',
    typescript = 'rainbow-parens',
    tsx = 'rainbow-delimiters-react',
  },
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
  },
}

local conf = {
  RainbowDelimiterRed = { link = 'rainbowcol3' },
  RainbowDelimiterOrange = { link = 'rainbowcol2' },
  RainbowDelimiterYellow = { link = 'rainbowcol7' },
  RainbowDelimiterGreen = { link = 'rainbowcol4' },
  RainbowDelimiterCyan = { link = 'rainbowcol5' },
  RainbowDelimiterBlue = { link = 'rainbowcol6' },
  RainbowDelimiterViolet = { link = 'rainbowcol1' },
}
require('utils.highlight').set_hl(conf)

-- rainbowcol7    xxx guifg=#ebcb8b  -- Orange
-- rainbowcol6    xxx guifg=#b48ead  -- Purple
-- rainbowcol5    xxx guifg=#88c0d0  -- Cyan
-- rainbowcol4    xxx guifg=#8fbcbb  -- Green
-- rainbowcol3    xxx guifg=#bf616a  -- Red
-- rainbowcol2    xxx guifg=#ebcb8b  -- Orange
-- rainbowcol1    xxx guifg=#b48ead  -- Purple
