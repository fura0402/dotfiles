local M = {}

M.iceberg= function ()
    vim.cmd([[
        colorscheme iceberg
        highlight Comment cterm=italic gui=italic
    ]])
    require('lualine').setup({
        options = {
            theme = 'iceberg_dark',
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
        }
    })
    require("bufferline").setup{}
    require('nvim-web-devicons').set_up_highlights()
end

M.neosolarized = function ()
    require('neosolarized-config').setup()
    require('lualine').setup({
        options = {
            theme = 'solarized_dark',
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
        }
    })
    require("bufferline").setup{}
    require('nvim-web-devicons').set_up_highlights()
end

M.nord = function ()
    vim.cmd([[
        colorscheme nord
        highlight MatchParen gui=bold guibg=#434C5E
        highlight Comment cterm=italic gui=italic
    ]])
    require('lualine').setup({
        options = {
            theme = 'nord',
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
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
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
        },
        sections = {
            lualine_x = {
                { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }, colored = false },
                'encoding',
                { 'fileformat', symbols = { unix = '', dos = '', mac = '' } },
                'filetype'
            },
        },

    })
    require("bufferline").setup{}
    require('nvim-web-devicons').set_up_highlights()
end

return M
