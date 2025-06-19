return {
	{
		"rcarriga/nvim-notify",
		enabled = true,
		lazy = false,
		opts = {},
		config = function()
			vim.notify = require("notify")
		end,
	},
	-- Pickers
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		lazy = true,
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = function() return vim.fn.executable "make" == 1 end, },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			}
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
		end,
	},
	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		enabled = true,
		lazy = false,
		version = "*",
		config = function()
			require("plugins.config.ui.toggleterm")
		end,
	},
	-- Explorer
	{
		"echasnovski/mini.files",
		enabled = true,
		lazy = false,
		config = function()
			require("plugins.config.ui.mini.files")
		end
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		opts = {},
	},
	-- Greeter
	{
		"nvimdev/dashboard-nvim",
		enabled = true,
		lazy = true,
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function() require("plugins.config.ui.dashboard") end,
	},
}
