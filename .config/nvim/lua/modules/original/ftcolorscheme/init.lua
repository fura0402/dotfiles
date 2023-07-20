local api = vim.api
local scheme = require('modules.original.ftcolorscheme.colorscheme_config')

scheme.default()
function ftColorSchemeSet()
  local function ftCheck(filetype, ftList)
    for _, ft in pairs(ftList) do
      if filetype == ft then
        return true
      end
    end
    return false
  end

  local ft = vim.bo.filetype
  if ftCheck(ft, { 'c' }) then
    scheme.default()
  elseif
    ftCheck(ft, {
      'html',
      'css',
      'scss',
      'sass',
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    })
  then
    scheme.neosolarized()
  elseif ftCheck(ft, { 'rust', 'toml', 'go' }) then
    scheme.iceberg()
  elseif ftCheck(ft, { 'cpp', 'markdown', 'python' }) then
    scheme.catppuccin()
  elseif ftCheck(ft, { 'lua' }) then
    scheme.nord()
  else
    --
  end
end

api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('BufReload', {}),
  callback = function()
    ftColorSchemeSet()
  end,
})

api.nvim_create_user_command('Scheme', function(opts)
  require('modules.original.ftcolorscheme.colorscheme_config')[opts.args]()
end, {
  nargs = 1,
  complete = function(arg_lead, _, _)
    return vim.tbl_filter(function(item)
      return vim.startswith(item, arg_lead)
    end, {
      'default',
      'catppuccin',
      'neosolarized',
      'iceberg',
      'nord',
    })
  end,
})
