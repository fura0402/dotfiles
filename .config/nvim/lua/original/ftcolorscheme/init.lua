local scheme = require('original.ftcolorscheme.colorscheme_config')

function ftColorSchemeSet()
    local ft = vim.bo.filetype
    if ft == 'html' then
        scheme.solarized()
    elseif ft == 'css' then
        scheme.solarized()
    elseif ft == 'json' then
        scheme.solarized()
    elseif ft == 'javascript' then
        scheme.solarized()
    elseif ft == 'typescript' then
        scheme.solarized()
    elseif ft == 'rust' then
        scheme.iceberg()
    elseif ft == 'go' then
        scheme.iceberg()
    elseif ft == 'lua' then
        scheme.nord()
        vim.cmd('edit')
    elseif ft == 'NvimTree' then
        --
    elseif ft == '' then
        --
    else
        scheme.default()
    end
end


vim.cmd ([[
    "function! BufCheck_reload() abort
    "    if expand("%") !=# ''
    "        edit
    "    endif
    "endfunction

    augroup buf_reload
        autocmd!
        "autocmd BufWinEnter * call BufCheck_reload()
        autocmd BufWinEnter * call v:lua.ftColorSchemeSet()
    augroup END
]])
