return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		enabled = true,
		opts = {},
	},
	{
		"brenoprata10/nvim-highlight-colors",
		enabled = true,
		event = "BufReadPre",
		opts = {
			render = "background",
			enable_named_colors = true,
			enable_tailwind = true,
		},
	},
	{
		"nvim-mini/mini.cursorword",
		version = false,
		enabled = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			delay = 100,
		},
	},
}
