return {
	--- auto closing
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
	--- align structures
	{
		"echasnovski/mini.align",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			-- require("plugins.config.editing.mini_align")
			require("mini.align").setup()
		end,
	},
	--- split/join objects
	{
		"echasnovski/mini.splitjoin",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	--- sourround with motions
	{
		"echasnovski/mini.surround",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
	--- find and replace in a buffer
	{
		"nvim-pack/nvim-spectre",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
}

