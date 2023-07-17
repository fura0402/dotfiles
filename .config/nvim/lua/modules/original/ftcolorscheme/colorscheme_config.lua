local M = {}

local common_hl = {
  NormalFloat = { link = 'Normal' },
  FloatBorder = { link = 'Normal' },
}

M.iceberg = function()
  vim.cmd([[colorscheme iceberg]])
  require('utils.highlight').set_hl(table.merge(common_hl, {
    Comment = { ctermfg = 242, fg = '#6B7089', cterm = italic, italic = true },
  }))
  require('modules.lsp.highlight.iceberg')
  require('modules.lualine').setup({
    theme = 'iceberg_dark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    diagnostics_colored = true,
  })
  require('modules.bufferline').setup({
    separator_style = 'slant',
  })
  require('nvim-web-devicons').set_up_highlights()
end

M.neosolarized = function()
  require('modules.neosolarized').setup()
  require('modules.lualine').setup({
    theme = 'solarized_dark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    diagnostics_colored = true,
  })
  require('modules.bufferline').setup({
    separator_style = 'slant',
  })
  require('nvim-web-devicons').set_up_highlights()
end

M.nord = function()
  require('nord').set()
  require('utils.highlight').set_hl(table.merge(common_hl, {
    MatchParen = { bg = '#434C5E', bold = true },
    Comment = { fg = '#616e88', cterm = italic, italic = true },
  }))
  require('modules.lualine').setup({
    theme = 'nord',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    diagnostics_colored = true,
  })
  require('modules.bufferline').setup({
    separator_style = 'thin',
  })
  require('nvim-web-devicons').set_up_highlights()
end

M.catppuccin = function()
  require('catppuccin').setup({
    dim_inactive = {
      enabled = true,
      shade = 'dark',
      percentage = 0.15,
    },
    integrations = {
      cmp = true,
      fidget = true,
      gitsigns = true,
      headlines = true,
      hop = true,
      lsp_saga = true,
      lsp_trouble = true,
      markdown = true,
      mason = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      ts_rainbow2 = true,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { 'italic' },
        hints = { 'italic' },
        warnings = { 'italic' },
        information = { 'italic' },
      },
      underlines = {
        errors = { 'underline' },
        hints = { 'underline' },
        warnings = { 'underline' },
        information = { 'underline' },
      },
    },
  })
  vim.cmd.colorscheme('catppuccin-mocha')
  require('utils.highlight').set_hl(common_hl)
  require('modules.lualine').setup({
    theme = 'catppuccin',
    section_separators = { left = '', right = '' },
    component_separators = '|',
    diagnostics_colored = true,
  })
  require('modules.bufferline').setup({
    separator_style = 'slant',
    highlights = require('catppuccin.groups.integrations.bufferline').get(),
  })
  require('lspsaga').setup({
    ui = {
      kind = require('catppuccin.groups.integrations.lsp_saga').custom_kind(),
    },
  })
  require('nvim-web-devicons').set_up_highlights()
end

M.default = function()
  vim.cmd.colorscheme('ownDefault')
  require('utils.highlight').set_hl(common_hl)
  require('modules.lualine').setup({
    theme = require('modules.lualine.themes.ownDefault'),
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    diagnostics_colored = false,
  })
  require('modules.bufferline').setup({
    separator_style = 'thin',
  })
  require('nvim-web-devicons').set_up_highlights()
end

return M
