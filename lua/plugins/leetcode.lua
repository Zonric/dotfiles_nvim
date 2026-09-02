return {
	{
		"kawre/leetcode.nvim",
		enabled = true,
		cmd = "Leet",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lang = "cpp",
			storage = {
				home = vim.fn.stdpath("data") .. "/leetcode",
				cache = vim.fn.stdpath("cache") .. "/leetcode",
			},
			cache = {
				update_interval = 60 * 60 * 24 * 7,
			},
			logging = true,
		},
	},
}
