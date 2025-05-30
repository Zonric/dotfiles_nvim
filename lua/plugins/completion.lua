return {
	{
		"Exafunction/codeium.nvim",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
		dependencies = { "nvim-lua/plenary.nvim", },
		opts = {},
	},
	{
		"onsails/lspkind.nvim",
		enabled = true,
		lazy = false,
		config = function()
			require("plugins.config.completion.lspkind")
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		enabled = true,
		lazy = false,
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			history = true,
		},
	},
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			-- "hrsh7th/cmp-emoji",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins.config.completion.cmp")
		end,
	},
	{
		"allaman/emoji.nvim",
		ft = "markdown",
		opts = {
			enable_cmp_integration = true,
		},
		config = function(_, opts)
			require("emoji").setup(opts)
		end,
	},
}

