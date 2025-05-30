return {
	-- Color Scheme
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 999,
		init = function()
			vim.cmd.colorscheme "nightfox"
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#131a24", underline = true })
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
		"feline-nvim/feline.nvim",
		enabled = true,
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
