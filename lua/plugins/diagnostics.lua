return {
	{
		"folke/trouble.nvim",
		enabled = true,
		lazy = false,
		cmd = "Trouble",
		dependencies = {},
		opts = {},
	},
	{
		"mfussenegger/nvim-lint",
		enabled = true,
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.config.diagnostics.nvim-lint")
		end,
	},
	{
		"folke/todo-comments.nvim",
		enabled = true,
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.config.diagnostics.todo-comments")
		end
	},
	{
		dir = vim.fn.stdpath("config") .. "/local-plugins/theme-lint",
		name = "theme-lint",
		enabled = true,
		lazy = false,
		config = function()
			require("plugins.config.diagnostics.theme-lint")
		end,
	}
}

