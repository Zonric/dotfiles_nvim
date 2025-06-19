return {
	-- Color Scheme
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 999,
		init = function()
			-- local theme = require("utils.theme").load(vim.fn.expand("~/.config/themes/active"))
			vim.cmd.colorscheme("nightfox")
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2E3C50", underline = true })
			-- vim.api.nvim_set_hl(0, "Normal", { fg = theme.fg, bg = theme.bg })
		end,
		opts = {},
	},
	-- Syntax Highlighting
	{
		"jwalton512/vim-blade",
		enabled = true,
		lazy = false,
	},
	-- Informational Blocks
	{
		"akinsho/bufferline.nvim",
		enabled = true,
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
	{
		"rebelot/heirline.nvim",
		enabled = true,
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"linrongbin16/commons.nvim",
		},
		config = function() require("plugins.config.decor.heirline") end,
	},
	{
		"feline-nvim/feline.nvim",
		enabled = false,
		lazy = false,
		dependencies = {},
		config = function()
			require("plugins.config.decor.feline")
		end,
	},
	-- Highlight Color Codes
	{
		"brenoprata10/nvim-highlight-colors",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	-- Highlighting current word under cursor
	{
		"echasnovski/mini.cursorword",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
    opts = {
			delay = 250,
		},
	},
	-- Chunk Highlighting
	{
		"echasnovski/mini.indentscope",
		enabled = true,
		lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    opts = {
			draw = {
				delay = 250,
			},
			symbol = '╎',
		},
	},
	-- LSP status
	{
		"j-hui/fidget.nvim", opts = {}
	},
	-- ICONS
	{
		"echasnovski/mini.icons",
		enabled = true,
		lazy = false,
		opts = {},
	},
}
