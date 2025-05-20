return {
	{
		"windwp/nvim-autopairs",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
		opts = {},
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
		opts = {
			opts = {
				enable_close_on_slash = true,
			},
		},
	},
}
