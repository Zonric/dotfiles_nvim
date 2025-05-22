return {
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
}

