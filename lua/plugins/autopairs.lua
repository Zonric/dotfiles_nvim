return {
	{
		"windwp/nvim-autopairs",
		enabled = false,
		lazy = true,
		event = "InsertEnter",
		opts = {},
	},{
		"windwp/nvim-ts-autotag",
		enabled = true,
		event = "VeryLazy",
		opts = {
			aliases = {
				["blade"] = "html",
			}
		},
		config = function()
			require("nvim-ts-autotag").setup()
		end
	},
}

