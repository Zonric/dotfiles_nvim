return {
	-- LSP Configs
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		lazy = false,
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "folke/lazydev.nvim", ft = "lua", opts = { library = { path = "${3rd}/luv/library", words = { "vim%.uv" } } } },
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			require("plugins/config/lsp")
		end,
	},
	-- Autoformat
	{
		"stevearc/conform.nvim",
		enabled = true,
		lazy = true,
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			notify_on_error = false,
			format_on_save = false,
			formatters_by_ft = {
				lua = { "stylua" },
				blade = { "blade-formatter" },
			},
		},
	},
	-- Autocompletion
	{
		"saghen/blink.cmp",
		version = "1.*",
		enabled = true,
		lazy = true,
		event = "VimEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				enabled = true,
				build = (function()
					if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {},
				opts = {},
				config = function() require("plugins/config/snippet") end,
			},
			"folke/lazydev.nvim",
		},
		opts = {
			keymap = {
				preset = "default",
			},
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = false, auto_show_delay_ms = 500 },
			},
			sources = {
				default = { "lsp", "path", "snippets", "lazydev" },
				providers = {
					lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				},
			},
			snippets = { preset = "luasnip" },
			fuzzy = { implementation = "lua" },
			signature = { enabled = true },
		},
	},
}
