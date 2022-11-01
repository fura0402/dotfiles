local scheme = require('original.ftcolorscheme.colorscheme_config')

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
    if ftCheck( ft, { 'html', 'css', 'scss', 'sass', 'json', 'javascript','javascriptreact', 'typescript', 'typescriptreact' } ) then
        scheme.neosolarized()
    elseif ftCheck( ft, { 'markdown', 'rust', 'go' } ) then
        scheme.iceberg()
    elseif ftCheck( ft, { 'lua' } ) then
        scheme.nord()
    elseif ftCheck( ft, { 'help', 'man', 'NvimTree', '' } ) then
        --
    elseif ftCheck( ft, { 'plaintext', 'lspsagafindertitlebar', 'sagacodeaction', 'sagarename' } ) then
        --
    else
        scheme.default()
    end
end


vim.cmd ([[
    augroup buf_reload
        autocmd!
        autocmd BufWinEnter * call v:lua.ftColorSchemeSet()
    augroup END
]])
