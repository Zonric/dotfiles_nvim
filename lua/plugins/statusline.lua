return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		enabled = true,
		lazy = false,
		opts = {
			sections = {
				lualine_c = {{
					"filename",
					file_status = true,
					newfile_status = true,
					path = 1,
					shorting_target = 40,
					symbols = {
						modified = "[+]",
						readonly = "[RO]",
						unnamed = "[No Name]",
						newfile = "[New]",
					}
				}}
			}
		},
	},
}

-- lua/lazyvim/plugins/ui.lua
-- spiff up my lualine a bit

