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
    vim.cmd([[
        colorscheme NeoSolarized
        highlight MatchParen gui=bold guifg=NONE guibg=#A53331
    ]])
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
    vim.cmd([[
        colorscheme nord
        highlight MatchParen gui=bold guibg=#434C5E
    ]])
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
    vim.cmd('colorscheme ownDefault')
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
