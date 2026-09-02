return {
	{
		"stevearc/conform.nvim",
		enabled = true,
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
		enabled = true,
	},
}
