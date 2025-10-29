return {
	{
		"stevearc/conform.nvim",
		enabled = true,
		lazy = false,
		-- event = { "BufWritePre" },
		-- cmd = { "ConformInfo" },
		opts = {},
		config = function()
			require("plugins.config.formatting.conform")
		end,
	},
}
