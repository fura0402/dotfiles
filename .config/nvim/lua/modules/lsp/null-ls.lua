local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    bufnr = bufnr,
    filter = function(client)
      return client.name == 'null-ls'
    end,
  })
end

null_ls.setup({
  sources = {
    formatting.prettierd.with({
      disabled_filetypes = { 'markdown' },
    }),
    require('none-ls.diagnostics.eslint_d').with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
    }),
    diagnostics.stylelint,
    formatting.clang_format.with({
      extra_args = { '--style=file:' .. vim.fn.stdpath('config') .. '/utils/linter-config/.clang-format' },
    }),
    formatting.stylua.with({
      extra_args = { '--config-path', vim.fn.stdpath('config') .. '/utils/linter-config/.stylua.toml' },
    }),
    completion.luasnip,
  },
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})
