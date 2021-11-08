vim.cmd ([[
    let g:python3_host_prog = expand('~/nvim-python3/bin/python3')

    filetype plugin indent on
    syntax enable

    colorscheme ownDefault
    highlight SignColumn ctermbg=0 guibg=#000000
    highlight Pmenu ctermfg=250 ctermbg=235 guifg=#bcbcbc guibg=#262626
    highlight PmenuSel ctermfg=0 ctermbg=13 guifg=#000000 guibg=#fd55ff


    autocmd FileType * setlocal formatoptions-=r
    autocmd FileType * setlocal formatoptions-=o
    
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    language en_US.UTF-8
    language message en_US.UTF-8
    "language ja_JP.UTF-8
    "language message ja_JP.UTF-8
]])

vim.o.encoding = 'utf-8'
vim.o.fileformats = 'unix,mac,dos'
vim.o.fileencodings = 'utf-8,iso-2022-jp,euc-jp,sjis'

vim.o.number = true
vim.o.relativenumber = true
vim.o.title = true
vim.o.showmode = false
vim.o.showmatch = true
vim.o.matchpairs = '(:),{:},[:],<:>'
vim.o.backspace = 'indent,eol,start'
vim.o.clipboard = 'unnamed'
vim.o.splitright = true
vim.o.updatetime = 100
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.showtabline = 2
vim.o.helpheight = 999

--vim.o.showbreak='↪'
vim.o.whichwrap = 'b,s,h,l'
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true
vim.o.hlsearch = true
