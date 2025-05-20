return {
	-- Color Scheme
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 999,
		init = function()
			vim.cmd.colorscheme "nightfox"
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#131a24", underline = true })
		end,
		opts = {},
	},
	-- Informational Blocks
	{
		"akinsho/bufferline.nvim",
		enabled = true,
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	}, {
		"feline-nvim/feline.nvim",
		enabled = true,
		lazy = false,
		dependencies = {},
		config = function()
			require("plugins.config.feline")
		end,
	},
	-- Greeter
	{
		"nvimdev/dashboard-nvim",
		enabled = true,
		lazy = true,
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function() require("plugins/config/dashboard") end,
	},
}
