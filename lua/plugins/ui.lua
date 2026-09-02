return {
	{
		"nvim-mini/mini.files",
		enabled = true,
		lazy = true,
		opts = {
			mappings = {
				close = 'q',
				go_in = 'l',
				go_in_plus  = '<CR>',
				go_out      = 'h',
				go_out_plus = '<BS>',
				mark_goto   = "'",
				mark_set    = 'm',
				reset       = 'R',
				reveal_cwd  = '@',
				show_help   = 'g?',
				synchronize = '=',
				trim_left   = '<',
				trim_right  = '>',
			},
		},
	},
	{
		"nvim-mini/mini.pick",
		version = "*",
		enabled = true,
	},
	{
		"akinsho/bufferline.nvim",
		enabled = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		enabled = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				disabled_filetypes = {
					statusline = { "dashboard", "alpha", "NvimTree" },
					winbar = {},
				},
				globalstatus = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						function()
							return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
						end,
						icon = "󰉋",
					},
					{ "filename", path = 1 },
				},
				lualine_x = { "searchcount", "filesize" },
				lualine_y = { "location", "filetype" },
				lualine_z = { "lsp_status" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		},
	},
	{
		"folke/which-key.nvim",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		opts = {},
	},
}
