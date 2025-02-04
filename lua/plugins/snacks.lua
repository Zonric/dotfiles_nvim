return {
	{
		"folke/snacks.nvim",
		enabled = true,
		event = "VeryLazy",
		opts = {
			picker = {
				enabled = true,
				debug = { scores = true, },
				frecency = true,
				layout = {
					preset = "ivy",
					cycle = false,
				},
				on_show = function()
					vim.cmd.stopinsert()
				end
			}
		},
	},
}
