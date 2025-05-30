return {
	{
		"lewis6991/gitsigns.nvim",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {},
		opts = {},
		config = function() require("plugins.config.git.gitsigns") end,
	},
	{
		"kdheepak/lazygit.nvim",
		enabled = true,
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
}

