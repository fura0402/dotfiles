vim.cmd([[
  set laststatus=2
  "set statusline=%<   
  "set statusline+=[%n]
  "set statusline+=%m  
  "set statusline+=%r  
  "set statusline+=%h  
  "set statusline+=%w  
  "set statusline+=%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}
  set statusline+=%y
  set statusline+=\
  "if winwidth(0) >= 130
  "    set statusline+=%F
  "else
  "    set statusline+=%t
  "endif
  set statusline+=%t
  set statusline+=%=
  "set statusline+=%{fugitive#statusline()}
  set statusline+=\ \
  set statusline+=%1l
  set statusline+=/
  set statusline+=%L
  set statusline+=,
  set statusline+=%c
  set statusline+=%V
  set statusline+=\ \
  set statusline+=%P
]])
