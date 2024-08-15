local M = {}

local conditions = require('heirline.conditions')

local delimiters = require('modules.heirline.components.delimiter')

---Return the LspDiagnostics from the LSP servers
M.Diagnostics = {

  condition = conditions.has_diagnostics,

  init = function(self)
    self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

    -- Others symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
    self.error_icon = vim.fn.sign_getdefined('DiagnosticSignError')[1].text
    self.warn_icon = vim.fn.sign_getdefined('DiagnosticSignWarn')[1].text
    self.info_icon = vim.fn.sign_getdefined('DiagnosticSignInfo')[1].text
    self.hint_icon = vim.fn.sign_getdefined('DiagnosticSignHint')[1].text
  end,

  update = { 'DiagnosticChanged', 'BufEnter' },

  -- Errors
  {
    condition = function(self)
      return self.errors > 0
    end,
    {
      hl = { fg = 'diag_error_fg', bg = 'diag_error_bg', bold = true, reverse = true, force = true },
      delimiters.RightMiddleSeparator,
    },
    {
      provider = function(self)
        return ' ' .. self.error_icon .. self.errors .. ' '
      end,
      hl = { fg = 'diag_error_fg', bg = 'diag_error_bg', bold = true },
    },
    {
      hl = { fg = 'diag_error_fg', bg = 'diag_error_bg', bold = true, force = true },
      delimiters.RightSubSeparator,
    },
  },
  -- Warnings
  {
    condition = function(self)
      return self.warnings > 0
    end,
    {
      hl = { fg = 'diag_warn_fg', bg = 'diag_warn_bg', bold = true, reverse = true, force = true },
      delimiters.RightMiddleSeparator,
    },
    {
      provider = function(self)
        return ' ' .. self.warn_icon .. self.warnings .. ' '
      end,
      hl = { fg = 'diag_warn_fg', bg = 'diag_warn_bg', bold = true },
    },
    {
      hl = { fg = 'diag_warn_fg', bg = 'diag_warn_bg', bold = true, force = true },
      delimiters.RightSubSeparator,
    },
  },
  -- Info
  {
    condition = function(self)
      return self.info > 0
    end,
    {
      hl = { fg = 'diag_info_fg', bg = 'diag_info_bg', bold = true, reverse = true, force = true },
      delimiters.RightMiddleSeparator,
    },
    {
      provider = function(self)
        return ' ' .. self.info_icon .. self.info .. ' '
      end,
      hl = { fg = 'diag_info_fg', bg = 'diag_info_bg', bold = true },
    },
    {
      hl = { fg = 'diag_info_fg', bg = 'diag_info_bg', bold = true, force = true },
      delimiters.RightSubSeparator,
    },
  },
  -- Hints
  {
    condition = function(self)
      return self.hints > 0
    end,
    {
      hl = { fg = 'diag_hint_fg', bg = 'diag_hint_bg', bold = true, reverse = true, force = true },
      delimiters.RightMiddleSeparator,
    },
    {
      provider = function(self)
        return ' ' .. self.hint_icon .. self.hints .. ' '
      end,
      hl = { fg = 'diag_hint_fg', bg = 'diag_hint_bg', bold = true },
    },
    {
      hl = { fg = 'diag_hint_fg', bg = 'diag_hint_bg', bold = true, force = true },
      delimiters.RightSubSeparator,
    },
  },
}

return M
