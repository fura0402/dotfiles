" True Color
let g:colors_name = expand('<sfile>:t:r')
highlight clear
if exists("syntax_on")
  syntax reset
endif
set background=dark

highlight SpecialKey ctermfg=81 guifg=#4cbdea
highlight NonText ctermfg=12 gui=NONE guifg=#5655ff
highlight Directory ctermfg=159 guifg=#96eaea
highlight ErrorMsg ctermfg=15 ctermbg=1 guifg=#ffffff guibg=#bc0004
highlight Search ctermfg=0 ctermbg=11 guifg=#000000 guibg=#fffc67
highlight MoreMsg ctermfg=121 gui=NONE guifg=#71e992
highlight LineNr ctermfg=11 guifg=#fffc67
highlight CursorLineNr ctermfg=11 gui=NONE guifg=#fffc67
highlight Question ctermfg=121 gui=NONE guifg=#71e992
highlight Title ctermfg=225 gui=NONE guifg=#eabaea
highlight Visual ctermbg=242 guibg=#5a5959
highlight WarningMsg ctermfg=224 guifg=#ffd7d7
highlight WildMenu ctermfg=0 ctermbg=11 guifg=#000000 guibg=#fffc67
highlight Folded ctermfg=14 ctermbg=242 guifg=#40ffff guibg=#5a5959
highlight FoldColumn ctermfg=14 ctermbg=242 guifg=#40ffff guibg=#5a5959
highlight DiffAdd ctermbg=4 guibg=#0d00bc
highlight DiffChange ctermbg=5 guibg=#bc00bb
highlight DiffDelete ctermfg=12 ctermbg=6 gui=NONE guifg=#5655ff guibg=#1bbabb
highlight DiffText cterm=bold ctermbg=9 gui=bold guibg=#ff6d67
highlight SignColumn ctermfg=14 ctermbg=0 guifg=#40ffff guibg=#000000
highlight Conceal ctermfg=7 ctermbg=242 guifg=#b4b4b4 guibg=#5a5959
highlight SpellBad ctermbg=9 gui=undercurl guisp=#ff6d67
highlight SpellCap ctermbg=12 gui=undercurl guisp=#5655ff
highlight SpellRare ctermbg=13 gui=undercurl guisp=#fd55ff
highlight SpellLocal ctermbg=14 gui=undercurl guisp=#40ffff
highlight Pmenu ctermfg=250 ctermbg=235 guifg=#bcbcbc guibg=#262626
highlight PmenuSel ctermfg=0 ctermbg=13 guifg=#000000 guibg=#fd55ff
highlight PmenuSbar ctermbg=248 guibg=#979797
highlight PmenuThumb ctermbg=15 guibg=#ffffff
highlight TabLine cterm=underline ctermfg=15 ctermbg=242 gui=underline guibg=#ffffff guibg=#5a5959
highlight CursorColumn ctermbg=242 guibg=#5a5959
highlight CursorLine cterm=underline guibg=#5a5959
highlight ColorColumn ctermbg=1 guibg=#bc0004
highlight RedrawDebugClear ctermbg=11 guibg=#fffc67
highlight RedrawDebugComposed ctermbg=10 guibg=#71e992
highlight RedrawDebugRecompose ctermbg=9 guibg=#ff6d67
highlight NormalFloat guifg=#c7c7c7 guibg=#000000
highlight FloatShadow guibg=#000000 blend=80
highlight FloatShadowThrough guibg=#000000 blend=100
highlight MatchParen cterm=bold ctermbg=1 gui=bold guibg=#bc0004
highlight NvimInternalError ctermfg=9 ctermbg=9 guifg=#ff6d67 guibg=#ff6d67

" syntax enable
highlight Comment cterm=italic ctermfg=14 gui=italic guifg=#60fdff
highlight Constant ctermfg=13 guifg=#fd55ff
highlight Special ctermfg=224 guifg=#57c5ea
highlight Statement ctermfg=11 gui=NONE guifg=#fffc67
highlight PreProc ctermfg=81 guifg=#4cbdea
highlight Underlined cterm=underline ctermfg=81 gui=underline guifg=#4cbdea
highlight Ignore ctermfg=0 guifg=#000000
highlight Todo ctermfg=0 ctermbg=11 guifg=#000000 guibg=#fffc67

" Nvim"
highlight Identifier cterm=bold ctermfg=14 gui=bold guifg=#40ffff

" Gitsigns
highlight GitSignsAdd    ctermfg=10 guifg=#00ff00
highlight GitSignsChange ctermfg=11 guifg=#ffff00
highlight GitSignsDelete ctermfg=9  guifg=#ff0000

" Indent BlankLine
highlight IndentBlanklineChar ctermfg=242 guifg=#5a5959
highlight IndentBlanklineContextChar ctermfg=250 guifg=#bcbcbc
