local builtin = require('telescope.builtin')
require("telescope._extensions.zoxide.config").setup({
    mappings = {
        ["<C-o>"] = {
            keepinsert = true,
            action = function(selection)
                builtin.find_files({ cwd = selection.path })
            end
        },
    },
})
