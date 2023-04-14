local null_ls = require('null-ls')
local null_fmt = null_ls.builtins.formatting
local null_diag = null_ls.builtins.diagnostics

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
    null_fmt.prettierd.with({
      disabled_filetypes = { 'markdown' },
    }),
    null_diag.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
    }),
    null_fmt.rustfmt,
    -- null_diag.cpplint.with({
    --   diagnostics_format = '[cpplint] #{m}\n(#{c})',
    -- }),
    null_fmt.stylua.with({
      extra_args = { '--config-path', vim.fn.stdpath('config') .. '/utils/linter-config/.stylua.toml' },
    }),
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
