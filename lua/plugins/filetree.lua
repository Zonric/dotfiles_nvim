return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		enabled = true,
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",
		},
		opts = {
			close_if_last_window = true,
			window = {
				position = "left",
				width = 30,
			},
		},
	},
}

