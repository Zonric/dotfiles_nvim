return {
	{
		"nvim-tree/nvim-tree.lua",
		enabled = true,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			view = { width = 30 },
			filters = { dotfiles = true },
		},
	},
	{
		"nvim-mini/mini.files",
		enabled = true,
		lazy = true,
		opts = {
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "<CR>",
				go_out = "h",
				go_out_plus = "<BS>",
				mark_goto = "'",
				mark_set = "m",
				reset = "R",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
		},
	},
	{
		"rcarriga/nvim-notify",
		enabled = true,
		config = function()
			vim.notify = require("notify")
		end,
	},
	{
		"nvim-mini/mini.indentscope",
		version = false,
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
			draw = {
				delay = 50,
			},
		},
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
				lualine_z = {
					"lsp_status",
					{
						function()
							local ok, conform = pcall(require, "conform")
							if not ok then
								return ""
							end
							local formatters = conform.list_formatters(0)
							local names = {}
							for _, formatter in ipairs(formatters) do
								table.insert(names, formatter.name)
							end
							return #names > 0 and table.concat(names, ", ") or ""
						end,
						icon = "",
					},
				},
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
