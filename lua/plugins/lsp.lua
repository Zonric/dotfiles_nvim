return {
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		lazy = false,
		config = function()
			require("plugins.config.lsp.lspconfig")
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		enabled = true,
		lazy = true,
		event = "LspAttach",
    config = function()
      require("plugins.config.lsp.lsp_signature")
    end
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
}

