-- lspconfig
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap('n', '<space>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end


-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- from cssls
--capabilities.textDocument.completion.completionItem.snippetSupport = true


local sumneko_system_name
local lemminx_system_name
if vim.fn.has("mac") == 1 then
    sumneko_system_name = "macOS"
    lemminx_system_name = "osx-x86_64"
elseif vim.fn.has("unix") == 1 then
    sumneko_system_name = "Linux"
    lemminx_system_name = "linux"
elseif vim.fn.has('win32') == 1 then
    sumneko_system_name = "Windows"
    lemminx_system_name = "win32"
else
    print("Unsupported system for sumneko")
end

-- lsp servers path
local lsp_servers_path = vim.fn.stdpath('data').."/lsp_servers"

-- set the path to the sumneko installation;
local sumneko_root_path = lsp_servers_path.."/lua-language-server"
local sumneko_binary = sumneko_root_path.."/bin/"..sumneko_system_name.."/lua-language-server"

-- set the path to the lemminx installation;
local lemminx_root_path = lsp_servers_path.."/lemminx"
local lemminx_binary = lemminx_root_path.."/lemminx-"..lemminx_system_name

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


local servers = {
    "tsserver",
    "html",
    "cssls",
    "emmet_ls",
    "jsonls",

    "bashls",
    "clangd",
    "cmake",

    "rust_analyzer",
    "gopls",
    "dockerls",
    "pyright",
    "sumneko_lua",
    "vimls",

    "lemminx",
    "yamlls",
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- Setup lspconfig.
for _, lsp in ipairs(servers) do
    -- sumneko_lua
    if lsp == 'sumneko_lua' then
        require'lspconfig'.sumneko_lua.setup {
            cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
            settings = {
                Lua = {
                    runtime = {
                        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                        -- Setup your lua path
                        path = runtime_path,
                    },
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                    -- Do not send telemetry data containing a randomized but unique identifier
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
    elseif lsp == 'lemminx' then
        require'lspconfig'.lemminx.setup{
            cmd = { lemminx_binary };
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            },
            capabilities = capabilities,
        }
    else
        nvim_lsp[lsp].setup {
            on_attach = on_attach,
            flags = {
                debounce_text_changes = 150,
            },
            capabilities = capabilities,
        }
    end
end
