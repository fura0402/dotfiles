require("bufferline").setup{}
vim.cmd([[
nnoremap <silent>bd :bdelete<CR>
nnoremap <silent><Tab> :BufferLineCycleNext<CR>
nnoremap <silent><S-Tab> :BufferLineCyclePrev<CR>
]])
