local M = {}

M.iceberg= function ()
    vim.cmd('colorscheme iceberg')
    require('lualine').setup({
        options = {
            theme = 'iceberg_dark',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        }
    })
    require("bufferline").setup{}
    require('nvim-web-devicons').set_up_highlights()
end

M.solarized = function ()
    vim.cmd('colorscheme NeoSolarized')
    require('lualine').setup({
        options = {
            theme = 'solarized_dark',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        }
    })
    require("bufferline").setup{}
    require('nvim-web-devicons').set_up_highlights()
end

M.nord = function ()
    vim.cmd('colorscheme nord')
    require('lualine').setup({
        options = {
            theme = 'nord',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        }
    })
    require("bufferline").setup{}
    require('nvim-web-devicons').set_up_highlights()
end

M.default = function ()
    vim.cmd([[
        colorscheme ownDefault
        highlight SignColumn ctermbg=0 guibg=#000000
        highlight Pmenu ctermfg=250 ctermbg=235 guifg=#bcbcbc guibg=#262626
        highlight PmenuSel ctermfg=0 ctermbg=13 guifg=#000000 guibg=#fd55ff
    ]])
    require('lualine').setup({
        options = {
            theme = 'ownDefault',
            component_separators = { left = '', right = ''},
            section_separators = { left = '', right = ''},
        }
    })
    require("bufferline").setup{}
    require('nvim-web-devicons').set_up_highlights()
end

return M
