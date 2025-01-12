return {
	{
		"kevinhwang91/nvim-bqf",
		enabled = true,
		lazy = false,
		opts = {},
	},{
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble" },
		opts = {
			use_diagnostic_signs = true,
			action_keys = { close = "q", cancel = "<esc>" },
		},
	},
}

