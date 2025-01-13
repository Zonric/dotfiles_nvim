local ascii = {}
ascii.BlockInlay = {
	"▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄",
	"█▄▄ ▄▄█ ████ ▄▄███▀▄▄▀█ ▄▄▀█ ▄▄███▄▄ ▄▄██ ▄▄▀██ ██ ██ ▄▄▄███ ▄▄█ ▄▀██▄██▄ ▄█▀▄▄▀█ ▄▄▀█",
	"███ ███ ▄▄ █ ▄▄███ ██ █ ██ █ ▄▄█████ ████ ▀▀▄██ ██ ██ ▄▄▄███ ▄▄█ █ ██ ▄██ ██ ██ █ ▀▀▄█",
	"███ ███▄██▄█▄▄▄████▄▄██▄██▄█▄▄▄█████ ████ ██ ██▄▀▀▄██ ▀▀▀███▄▄▄█▄▄██▄▄▄██▄███▄▄██▄█▄▄█",
	"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀",
}
ascii.Tmplr = {
	"┏┳┓┓             ┏┳┓┳┓┳┳┏┓     ┓•     ",
	" ┃ ┣┓┏┓  ┏┓┏┓┏┓   ┃ ┣┫┃┃┣   ┏┓┏┫┓╋┏┓┏┓",
	" ┻ ┛┗┗   ┗┛┛┗┗    ┻ ┛┗┗┛┗┛  ┗ ┗┻┗┗┗┛┛ ",
}

return {
	{
		"nvimdev/dashboard-nvim",
		enabled = true,
		lazy = true,
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			theme = "hyper",
			shortcut_type = "number",
      theme_custom = {},
      config = {
        header = ascii.BlockInlay,
				shortcut = {
					{ desc = "󰊳 Lazy Update", group = "@property", action = "Lazy update", key = "u" },
					{ desc = " Find Files", group = "@property", action = "Telescope find_files", key = "f" },
					{ desc = " Grep Files", group = "@property", action = "Telescope live_grep", key = "g" },
					{ desc = " Explore Directory", group = "@property", action = "Neotree toggle", key = "e" },
					{ desc = "󰩈 Exit NVim", group = "@property", action = "quit", key = "x" },
				},
			},
		},
	}
}

