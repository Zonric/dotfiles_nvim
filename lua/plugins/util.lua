return {
	{
		dir = vim.fn.expand("$HOME/dev/nvim/codecopy.nvim"),
		name = "codecopy_dev",
		enabled = false,
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = {
			codecopy = {
				openui = true,
				code_fence = true,
				include_file_path = true,
				gist_to_clipboard = true,
			},
			env = {
				enabled = true,
				env_path = vim.fn.expand("$HOME/dev/nvim/codecopy.nvim/env.json"),
			},
			messages = {
				notify = true,
				debug = true,
				silent = false,
			},
		},
	},
	{
		"Zonric/codecopy.nvim",
		branch = "master",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		opts = {
			codecopy = {
				openui = true,
				code_fence = true,
				include_file_path = true,
				gist_to_clipboard = true,
			},
			env = {
				enabled = true,
				env_path = "$HOME/.config/codecopy.nvim/env.json",
			},
			messages = {
				notify = true,
				debug = false,
				silent = false,
			},
		},
	},
}
