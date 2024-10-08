-- UI Customization --------------------------------------------------
local border = {
  { '╭', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╮', 'FloatBorder' },
  { '│', 'FloatBorder' },
  { '╯', 'FloatBorder' },
  { '─', 'FloatBorder' },
  { '╰', 'FloatBorder' },
  { '│', 'FloatBorder' },
}
-- LSP settings (for overriding per client)
local handlers = {
  ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}
-- To instead override globally
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   opts.border = opts.border or border
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

local signs = { Error = ' ', Warn = ' ', Info = ' ', Hint = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '■', '▎', 'x'
  },
  float = {
    source = 'always', -- Or "if_many"
  },
  severity_sort = true,
})

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = {
    spacing = 4,
    prefix = '●',
    severity = { min = vim.diagnostic.severity.WARN },
  },
  severity_sort = true,
  update_in_insert = false,
})

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.keymap.set('n', '[e', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
  vim.keymap.set('n', ']e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  vim.keymap.set('n', '<leader>e', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
  vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
  vim.keymap.set('n', 'gc', '<Cmd>Lspsaga code_action<CR>', opts)
  vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
  vim.keymap.set('n', '<leader>o', '<Cmd>Lspsaga outline<CR>', opts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
  vim.keymap.set('n', 'gd', '<cmd>Lspsaga peek_definition<CR>', opts)
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.offsetEncoding = 'utf-8' -- Resolving offset_encoding issues for several different clients (at null-ls)

local function check_os(cmd)
  local selected_cmd = nil
  if vim.fn.has('macunix') == 1 then
    selected_cmd = cmd.macunix
  elseif vim.fn.has('win32') == 1 then
    selected_cmd = cmd.win
  end
  return selected_cmd
end

local lspconfig = require('lspconfig')
-- Do not forget to use the on_attach function
for _, server_name in ipairs(require('mason-lspconfig').get_installed_servers()) do
  if server_name == 'lua_ls' then
    lspconfig.lua_ls.setup({
      handlers = handlers,
      capabilities = capabilities,
      on_attach = on_attach,
      on_init = function(client)
        local path = client.workspace_folders[1].name
        if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
          return
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT',
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- Depending on the usage, you might want to add additional paths here.
              -- "${3rd}/luv/library"
              -- "${3rd}/busted/library",
            },
            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
            -- library = vim.api.nvim_get_runtime_file("", true)
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })
  elseif server_name == 'tsserver' then
    local cmd = check_os({
      macunix = { 'typescript-language-server', '--stdio' },
      win = { 'typescript-language-server.cmd', '--stdio' },
    })
    lspconfig.tsserver.setup({
      handlers = handlers,
      capabilities = capabilities,
      on_attach = on_attach,
      -- filetypes = { "typescript" , "typescriptreact" },
      cmd = cmd,
    })
  elseif server_name == 'cssls' then
    lspconfig.cssls.setup({
      handlers = handlers,
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'css', 'scss', 'less', 'markdown' },
    })
  elseif server_name == 'emmet_ls' then
    lspconfig.emmet_ls.setup({
      handlers = handlers,
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less', 'eruby', 'markdown' },
    })
  elseif server_name == 'clangd' then
    -- local query_driver = check_os({
    --   macunix = '/usr/bin/clang++,/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++',
    --   win = '$HOME\\scoop\\apps\\gcc\\current\\bin\\g++.exe,$HOME\\scoop\\apps\\mingw\\current\\bin\\g++.exe',
    -- })
    lspconfig.clangd.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      single_file_support = true,
      cmd = {
        'clangd',
        '--background-index',
        '--pch-storage=memory',
        -- You MUST set this arg ↓ to your c/cpp compiler location (if not included)!
        -- query_driver,
        '--clang-tidy',
        '--all-scopes-completion',
        '--completion-style=detailed',
        '--header-insertion-decorators',
        '--header-insertion=iwyu',
        '--enable-config',
      },
    })
  elseif server_name ~= 'rust_analyzer' then
    lspconfig[server_name].setup({
      handlers = handlers,
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
end

-- lsp_signature
require('lsp_signature').setup({
  bind = true,
  floating_window = false,
  hint_enable = true,
  hint_prefix = '💡 ',
  handler_opts = {
    border = 'rounded',
  },
  check_completion_visible = true,
  toggle_key = '<C-k>',
})

-- Rust
local config = {}
function config.rust_setup()
  --
end

return config
