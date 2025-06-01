return {
	-- auto closing
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
	-- split/join objects
	{
		"echasnovski/mini.splitjoin",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	-- sourround with motions
	{
		"echasnovski/mini.surround",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	{
		"nvim-pack/nvim-spectre",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
}

