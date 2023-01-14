require'nvim-tree'.setup {
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_netrw = false,
  hijack_cursor = true,
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
  view = {
    width = 30,
    mappings = {
      list = {
        { key = "<C-f>", action = "close" },
      },
    },
  },
  renderer = {
    add_trailing = true,
    highlight_git = true,
    highlight_opened_files = "none",
    indent_markers = { enable = true },
  },
  actions = { open_file = { quit_on_open = true }, },
}
