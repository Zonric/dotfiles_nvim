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
		opts = {
			mode = "symbol_text",
			preset = "codicons",
			symbol_map = {
				Text = "󰉿", Method = "󰆧", Function = "󰊕", Constructor = "",
				Field = "󰜢", Variable = "󰀫", Class = "󰠱", Interface = "",
				Module = "", Property = "󰜢", Unit = "󰑭", Value = "󰎠",
				Enum = "", Keyword = "󰌋", Snippet = "", Color = "󰏘",
				File = "󰈙", Reference = "󰈇", Folder = "󰉋", EnumMember = "",
				Constant = "󰏿", Struct = "󰙅", Event = "", Operator = "󰆕",
				TypeParameter = "", Codeium = "󰆨",
			},
		}
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
		"hrsh7th/nvim-cmp",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins/config/cmp")
		end,
	},
}

