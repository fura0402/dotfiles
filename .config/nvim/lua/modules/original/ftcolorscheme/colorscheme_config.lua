local M = {}

M.iceberg = function()
  vim.cmd.packadd('iceberg.vim')
	vim.cmd.colorscheme("iceberg")
	require("utils.highlight").set_hl({
		Comment = { ctermfg = 242, fg = "#6B7089", cterm = italic, italic = true },
	})
	require("modules.lsp.highlight")
	require("modules.lualine").setup({
		theme = "iceberg_dark",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		diagnostics_colored = true,
	})
	require("modules.bufferline").setup({
		separator_style = "slant",
	})
	require("nvim-web-devicons").set_up_highlights()
end

M.neosolarized = function()
  vim.cmd.packadd('neosolarized.nvim')
	require("modules.neosolarized").setup()
	require("modules.lualine").setup({
		theme = "solarized_dark",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		diagnostics_colored = true,
	})
	require("modules.bufferline").setup({
		separator_style = "slant",
	})
	require("nvim-web-devicons").set_up_highlights()
end

M.nord = function()
  vim.cmd.packadd('nord.nvim')
	vim.cmd.colorscheme("nord")
	require("utils.highlight").set_hl({
		MatchParen = { bg = "#434C5E", bold = true },
		Comment = { fg = "#616e88", cterm = italic, italic = true },
	})
	require("modules.lualine").setup({
		theme = "nord",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		diagnostics_colored = true,
	})
	require("modules.bufferline").setup({
		separator_style = "thin",
	})
	require("nvim-web-devicons").set_up_highlights()
end

M.catppuccin = function()
  vim.cmd.packadd('catppuccin')
	require("catppuccin").setup({
		integrations = {
			fidget = true,
			hop = true,
			lsp_saga = true,
			lsp_trouble = true,
			nvimtree = true,
			ts_rainbow = true,
			which_key = true,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
	})
	vim.cmd.colorscheme("catppuccin-mocha")
	require("utils.highlight").set_hl({})
	require("modules.lualine").setup({
		theme = "catppuccin",
		section_separators = { left = "", right = "" },
		component_separators = "|",
		diagnostics_colored = true,
	})
	require("modules.bufferline").setup({
		separator_style = "slant",
		highlights = require("catppuccin.groups.integrations.bufferline").get(),
	})
	require("lspsaga").init_lsp_saga({
		custom_kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind(),
	})
	require("nvim-web-devicons").set_up_highlights()
end

M.default = function()
	vim.cmd.colorscheme("ownDefault")
	require("utils.highlight").set_hl({})
	require("modules.lualine").setup({
		theme = require("modules.lualine.themes.ownDefault"),
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		diagnostics_colored = false,
	})
	require("modules.bufferline").setup({
		separator_style = "thin",
	})
	require("nvim-web-devicons").set_up_highlights()
end

return M
