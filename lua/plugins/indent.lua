return {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		main = "ibl",
		opts = {},
	},
	{
		"shellRaining/hlchunk.nvim",
		enabled = true,
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		priority = 1,
		opts = {
			chunk = {
				enable = true,
				style = {
					{ fg = "#C3802B" },
				},
			},
			indent = {
				enable = true,
				style = {
					{ fg = "#1D2C8B" },
				},
			},
			line_num = {
				enable = true,
				style = "#0AB7FF",
			},
			blank = {
				enable = false,
			},
		},
	}
}
