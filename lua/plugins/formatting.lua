return {
	{
		"stevearc/conform.nvim",
		enabled = true,
		lazy = true,
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "black" },
				-- blade = { "blade-formatter" },
				php = { "php-cs-fixer" },
			},
			formatters = {
				php_cs_fixer = {
					command = "php-cs-fixer",
					args = { "fix", "--using-cache=no", "--quiet", "$FILENAME" },
					stdin = false,
					condition = function(ctx)
						vim.g.conform_log_level = "debug"
						return vim.fn.exectuable("php-cs-fixer") == 1
					end,
				},
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 375,
			},
			notify_on_error = false,
		},
	},
}
