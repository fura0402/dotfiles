local has = vim.fn.has
local is_macUnix = has('macunix')
local is_win = has('win32')
if is_macUnix == 1 then
  require('core.macunix')
elseif is_win == 1 then
  require('core.windows')
end

local disable_distribution_plugins = function()
  local g = vim.g
  -- g.loaded_python3_provider = 0
  g.loaded_node_provider = 0
  g.loaded_perl_provider = 0
  g.loaded_ruby_provider = 0

  -- Disable TOhtml.
  g.loaded_2html_plugin = 1

  -- Disavle archive file open and browse.
  g.loaded_gzip = 1
  g.loaded_tar = 1
  g.loaded_tarPlugin = 1
  g.loaded_zip = 1
  g.loaded_zipPlugin = 1

  -- Disable all.
  g.loaded_all = 1
  g.loaded_allPlugin = 1

  -- Disable netrw plugins.
  g.loaded_netrw = 1
  g.loaded_netrwPlugin = 1
  g.loaded_netrwSettings = 1
  g.loaded_netrwFileHandlers = 1

  -- Disable `GetLatestcript`.
  g.loaded_getscript = 1
  g.loaded_getscriptPlugin = 1

  -- Disable other plugins
  g.loaded_remote_plugins = 1
  g.loaded_man = 1
  g.loaded_matchit = 1
  g.loaded_matchparen = 1
  g.loaded_shada_plugin = 1
  g.loaded_spellfile_plugin = 1
  g.loaded_tutor_mode_plugin = 1
  g.did_install_default_menus = 1
  g.did_install_syntax_menu = 1
  g.skip_loading_mswin = 1
  g.did_indent_on = 1
  g.did_load_ftplugin = 1
  g.loaded_rrhelper = 1

  -- Disable sql omni completion.
  g.loaded_sql_completion = 1
end

local load_core = function()
  disable_distribution_plugins()
  require('core.options')
  require('core.mappings')
  --require('core.statusline')
  require('plugins').load_compile()
  require('modules.original.ftcolorscheme')
end

load_core()
