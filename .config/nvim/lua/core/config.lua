vim.cmd('autocmd!')

vim.cmd ([[
    let g:loaded_python_provider = 0
    let g:python3_host_prog = expand('~/nvim-python3/bin/python3')
    let g:ruby_host_prog = expand('~/.anyenv/envs/rbenv/versions/3.0.2/bin/neovim-ruby-host')
    let g:node_host_prog = expand('~/.anyenv/envs/nodenv/versions/16.13.1/bin/neovim-node-host')

    colorscheme ownDefault

    " Other than xterm-256color
    "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " undercurl
    let &t_Cs = "\e[4:3m"
    let &t_Ce = "\e[4:0m"

    language en_US.UTF-8
    language message en_US.UTF-8
    "language ja_JP.UTF-8
    "language message ja_JP.UTF-8
]])

vim.opt.encoding = 'utf-8'
vim.opt.fileformats = { 'unix', 'mac', 'dos' }
vim.opt.fileencodings = { 'utf-8', 'iso-2022-jp', 'euc-jp', 'sjis' }

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.title = true
vim.opt.showmode = false
vim.opt.showmatch = true
vim.opt.matchpairs = { '(:)', '{:}', '[:]', '<:>' }
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.clipboard = 'unnamed'
vim.opt.splitright = true
vim.opt.updatetime = 100
vim.opt.termguicolors = true
vim.opt.hidden = true
vim.opt.showtabline = 2
vim.opt.helpheight = 999
vim.api.nvim_create_autocmd('Filetype', {
    pattern = '*',
    command = 'setlocal formatoptions-=ro'
})

--vim.o.showbreak='↪'
vim.opt.whichwrap = 'b,s,h,l'
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
