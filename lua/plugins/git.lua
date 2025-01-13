return {
	{
		"lewis6991/gitsigns.nvim",
		enabled = true,
		lazy = false,
		opts = {},
	},{
		"f-person/git-blame.nvim",
		enabled = true,
		lazy = false,
		opts = {
			enabled = false,
		},
	},{
		"kdheepak/lazygit.nvim",
		enabled = true,
		lazy = true,
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
	},
}

