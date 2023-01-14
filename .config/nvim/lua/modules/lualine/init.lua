local M = {}

M.setup = function(opts)
  require('lualine').setup({
    options = {
      icons_enabled = true,
      theme = opts.theme or require('modules.lualine.themes.ownDefault'),
      section_separators = opts.section_separators or { left = '', right = '' },
      component_separators = opts.component_separators or { left = '', right = '' },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { { 'mode', color = { gui = 'bold' } } },
      lualine_b = { 'branch' },
      lualine_c = { { 'filename', file_status = true, path = 1 } },
      lualine_x = {
        {
          'diagnostics',
          sources = { 'nvim_diagnostic' },
          symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
          colored = opts.diagnostics_colored and true,
        },
        'encoding',
        { 'fileformat', symbols = { unix = '', dos = '', mac = '' } },
        'filetype',
      },
      lualine_y = { 'progress' },
      lualine_z = { { 'location', color = { gui = 'bold' } } },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { { 'filename', file_status = true, path = 1 } },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  })
end

return M
