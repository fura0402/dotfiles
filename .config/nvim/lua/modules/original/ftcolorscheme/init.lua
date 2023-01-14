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
    ftCheck(ft, { 'html', 'css', 'scss', 'sass', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' })
  then
    scheme.neosolarized()
  elseif ftCheck(ft, { 'markdown', 'rust', 'toml', 'go' }) then
    scheme.iceberg()
  elseif ftCheck(ft, { 'cpp', 'python' }) then
    scheme.catppuccin()
  elseif ftCheck(ft, { 'lua' }) then
    scheme.nord()
  else
    --
  end
end

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = vim.api.nvim_create_augroup('BufReload', {}),
  callback = function()
    ftColorSchemeSet()
  end,
})
