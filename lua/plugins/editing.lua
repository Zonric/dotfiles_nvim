return {
	{
		"windwp/nvim-autopairs",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
		config = true,
	},
	{
		"windwp/nvim-ts-autotag",
		enabled = true,
		lazy = true,
		event = "InsertEnter",
		opts = {},
	},
	{
		"nvim-mini/mini.surround",
		enabled = true,
		lazy = true,
		keys = {
			{ "sa", mode = { "n", "v" }, desc = "Surrounding add."},
			{ "sd", mode = "n", desc = "Surrounding delete."},
			{ "sf", mode = "n", desc = "Surrounding find forward."},
			{ "sF", mode = "n", desc = "Surrounding find backward."},
			{ "sh", mode = "n", desc = "Surrounding highlight"},
			{ "sr", mode = "n", desc = "Surrounding replace"},
		},
		mappings = {
			add = 'sa',
			delete = 'sd',
			find = 'sf',
			find_left = 'sF',
			highlight = 'sh',
			replace = 'sr',
			suffix_last = 'l',
			suffix_next = 'n',
		},
		opts = {},
	},
}

