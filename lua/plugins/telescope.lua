return {
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		enabled = true,
		lazy = false,
		opts = {},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {},
					}
				}
			})
			require("telescope").load_extension("ui-select")
		end
	},
}

