local config = {}

function config.setup()
  require('mason').setup({
    ui = {
      border = 'single',
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  })
end

function config.lspconfig()
  require('mason-lspconfig').setup({
    ensure_installed = {
      'bashls',
      'lua_ls',
      'clangd',
      'cmake',
      'cssls',
      'cssmodules_ls',
      'emmet_ls',
      'html',
      'tsserver',
      'rust_analyzer',
      'pyright',
      'gopls',
      'jsonls',
      'dockerls',
    },
    automatic_installation = true,
  })
end

function config.null_ls()
  require('mason-null-ls').setup({
    ensure_installed = {
      'cpplint',
      'prettierd',
      'eslint_d',
      'rustfmt',
      'stylua',
    },
    automatic_installation = true,
  })
end

return config
