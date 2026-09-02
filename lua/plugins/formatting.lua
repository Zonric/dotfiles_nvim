return {
	{
		"stevearc/conform.nvim",
		enabled = true,
		event = { "BufWritePre" },
		opts = {
			formatters = {
				prettier = {
					command = "/usr/bin/prettier",
				},
				shfmt = {
					args = { "-i", "0", "-ci", "-ln", "bash" },
				},
			},
			formatters_by_ft = {
				blade = { "blade-formatter" },
				lua = { "stylua" },
				php = { "php_cs_fixer" },
				sh = { "shfmt" },
				toml = { "tombi" },
				twig = { "twig-cs-fixer" },
				yaml = { "yamlfix" },
				zsh = { "beautysh" },
				python = { "isort", "black" },
			}
		},
	},
	{
		"mason-tool-installer.nvim",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"shfmt",
				"blade-formatter",
				"php-cs-fixer",
				"stylua",
				"tombi",
				"twig-cs-fixer",
				"yamlfix",
				"beautysh",
				"isort", "black",
			},
		},
	},
	{
		"nvim-mini/mini.align",
		version = '*',
		enabled = true,
		lazy = true,
		keys = {
			{ "ga", mode = { "n", "v" }, desc = "Align" },
			{ "gA", mode = { "n", "v" }, desc = "Align with preview" },
		},
		mappings = {
			start = 'ga',
			start_with_preview = 'gA',
		},
		config = function() require("mini.align").setup() end,
	},
}
