return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {},
	},
}
