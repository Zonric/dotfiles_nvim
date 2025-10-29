return {
	{
		"supermaven-inc/supermaven-nvim",
		enabled = false,
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("plugins.config.completion.supermaven-nvim")
		end,
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
		lazy = true,
		event = "InsertEnter",
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		opts = {
			history = true,
		},
		config = function()
			require("luasnip.loaders.from_lua").lazy_load({ paths = { tostring(vim.fn.expand("$HOME/.config/nvim/snippets")) } })
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		lazy = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins.config.completion.cmp")
		end,
	},
	{
		"chrisgrieser/cmp-nerdfont",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
	},
	{
		"allaman/emoji.nvim",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
		config = function()
			require("emoji").setup({
				enable_cmp_integration = true,
			})
		end,
	},
}
