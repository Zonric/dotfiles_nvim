return {
	{
		"stevearc/conform.nvim",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			formatters = {
				goimports = {
					command = "goimports",
				},
				prettier = {
					command = "/usr/bin/prettier",
				},
				shfmt = {
					args = { "-i", "0", "-ci", "-ln", "bash" },
				},
				["clang-format"] = {
					command = "clang-format",
					args = { "-style=file" },
				},
			},
			formatters_by_ft = {
				blade = { "blade-formatter" },
				cpp = { "clang-format" },
				css = { "prettierd", "prettier", stop_after_first = true },
				go = { "goimports" },
				html = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "biome", "prettierd", "prettier", stop_after_first = true },
				lua = { "stylua" },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				php = { "php_cs_fixer" },
				python = { "isort", "black" },
				scss = { "prettierd", "prettier", stop_after_first = true },
				sh = { "shfmt" },
				toml = { "tombi" },
				twig = { "twig-cs-fixer" },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				yaml = { "prettierd", "prettier", stop_after_first = true },
				zsh = { "beautysh" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"goimports",
				"shfmt",
				"blade-formatter",
				"php-cs-fixer",
				"tombi",
				"twig-cs-fixer",
				"beautysh",
				"isort",
				"black",
				"prettierd",
				"js-debug-adapter",
			},
		},
	},
	{
		"nvim-mini/mini.align",
		version = "*",
		enabled = true,
		lazy = true,
		keys = {
			{ "ga", mode = { "n", "v" }, desc = "Align" },
			{ "gA", mode = { "n", "v" }, desc = "Align with preview" },
		},
		mappings = {
			start = "ga",
			start_with_preview = "gA",
		},
		config = function()
			require("mini.align").setup()
		end,
	},
}
