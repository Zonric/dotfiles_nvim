return {
	{
		"mistweaverco/diffconflicts.nvim",
		opts = {
			commands = {
				diff_conflicts = "DiffConflicts",
				show_history = "DiffConflictsShowHistory",
				with_history = "DiffConflictsWithHistory",
			},
			qol = {
				advance_on_save = true,
				quit_on_done = false,
			},
			keymaps = {
				next_diff = nil,
				prev_diff = nil,
				accept = nil,
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
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
		keys = {
			{ "<leader>gl", "<cmd>LazyGit<cr>", desc = "Lazygit" },
		},
	},
}
