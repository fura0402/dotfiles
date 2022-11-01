require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'ownDefault',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {{'mode', color = { gui='bold' }}},
        lualine_b = {'branch'},
        lualine_c = {{ 'filename', file_status = true, path = 1 }},
        lualine_x = {
            { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
            'encoding',
            { 'fileformat', symbols = { unix = '', dos = '', mac = '' } },
            'filetype'
        },
        lualine_y = {'progress'},
        lualine_z = {{'location', color = { gui='bold' }}}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{ 'filename', file_status = true, path = 1 }},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
})
