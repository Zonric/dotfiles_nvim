return {
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		lazy = false,
		config = function()
			require("plugins/config/lsp")
		end,
	},
	{
		"mason-org/mason.nvim",
		enabled = true,
		lazy = false,
		opts = {}
	},
	{
		"mason-org/mason-lspconfig.nvim",
		enabled = true,
		lazy = false,
		dependencies = {
			{ "mason-org/mason.nvim" },
			{ "neovim/nvim-lspconfig" }
		}
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		enabled = true,
		lazy = false,
	},
	{
		"folke/lazydev.nvim",
		enabled = true,
		lazy = false,
		ft = "lua",
		opts = {
			library = {
				path = "${3rd}/luv/library",
				words = { "vim%.uv" },
			},
		},
	},
	{
		"j-hui/fidget.nvim", opts = {}
	},
}

