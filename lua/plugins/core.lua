return {
	-- Utility Manager
	{
		"mason-org/mason.nvim",
		enabled = true,
		lazy = false,
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		enabled = true,
		lazy = false,
		opts = {},
	},
	-- Syntax Highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		enabled = true,
		lazy = false,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		opts = {
			ensure_installed = { "lua" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- Hotkey Discovery
	{
		"folke/which-key.nvim",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
}
