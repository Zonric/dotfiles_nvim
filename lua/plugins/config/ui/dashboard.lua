local db = require("dashboard")

local ascii = {
	oneTrueBlock = {
		"▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄",
		"█▄▄ ▄▄█ ████ ▄▄███▀▄▄▀█ ▄▄▀█ ▄▄███▄▄ ▄▄██ ▄▄▀██ ██ ██ ▄▄▄███ ▄▄█ ▄▀██▄██▄ ▄█▀▄▄▀█ ▄▄▀█",
		"███ ███ ▄▄ █ ▄▄███ ██ █ ██ █ ▄▄█████ ████ ▀▀▄██ ██ ██ ▄▄▄███ ▄▄█ █ ██ ▄██ ██ ██ █ ▀▀▄█",
		"███ ███▄██▄█▄▄▄████▄▄██▄██▄█▄▄▄█████ ████ ██ ██▄▀▀▄██ ▀▀▀███▄▄▄█▄▄██▄▄▄██▄███▄▄██▄█▄▄█",
		"▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀",
	},
	oneTrueTmplr = {
		"┏┳┓┓             ┏┳┓┳┓┳┳┏┓     ┓•     ",
		" ┃ ┣┓┏┓  ┏┓┏┓┏┓   ┃ ┣┫┃┃┣   ┏┓┏┫┓╋┏┓┏┓",
		" ┻ ┛┗┗   ┗┛┛┗┗    ┻ ┛┗┗┛┗┛  ┗ ┗┻┗┗┗┛┛ ",
	},
	bsNeoVim = {
		"                                                            ",
		"                                                            ",
		"     ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗     ",
		"     ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║     ",
		"     ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║     ",
		"     ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║     ",
		"     ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║     ",
		"     ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝     ",
		"                                                            ",
		"                                                            ",
	},
	sharpNeoVim = {
		"                                                                       ",
		"                                                                     ",
		"       ████ ██████           █████      ██                     ",
		"      ███████████             █████                             ",
		"      █████████ ███████████████████ ███   ███████████   ",
		"     █████████  ███    █████████████ █████ ██████████████   ",
		"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
		"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
		" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
		"                                                                       ",
		"                                                                       ",
		"                                                                       ",
	},
	archLinux = {
		"                                    ",
		"                                    ",
		"                  -`                ",
		"                 .o+`               ",
		"                `ooo/               ",
		"               `+oooo:              ",
		"              `+oooooo:             ",
		"              -+oooooo+:            ",
		"            `/:-:++oooo+:           ",
		"           `/++++/+++++++:          ",
		"          `/++++++++++++++:         ",
		"         `/+++ooooooooooooo/`       ",
		"        ./ooosssso++osssssso+`      ",
		"       .oossssso-````/ossssss+`     ",
		"      -osssssso.      :ssssssso.    ",
		"     :osssssss/        osssso+++.   ",
		"    /ossssssss/        +ssssooo/-   ",
		"  `/ossssso+/:-        -:/+osssso+- ",
		"  `+sso+:-`                `.-/+oso:",
		" `++:.                        `-/+/ ",
		".`                               `/ ",
		"                                    ",
		"                                    ",
	},
}

db.setup({
	theme = "doom",
	config = {
		header = ascii.sharpNeoVim,
		center = {
			{ icon = '󰈔  ', desc = 'New File',     action = 'ene | startinsert', key = 'n' },
			{ icon = '󰈞  ', desc = 'Find File',    action = 'Telescope find_files', key = 'f' },
			{ icon = '  ', desc = " Grep Files",  action = "Telescope live_grep", key = "g" },
			{ icon = '󰊄  ', desc = 'Recent Files', action = 'Telescope oldfiles', key = 'r' },
			{ icon = '󰈢  ', desc = 'Open Config',  action = 'cd ~/.config/nvim | edit init.lua', key = 'c' },
			{ icon = '󰩈  ', desc = "Quit NVim",    action = "qa", key = "q" },
		},
		footer = function()
			local datetime = os.date("%A, %B %d %Y %H:%M")
			local username = os.getenv("USER") or os.getenv("USERNAME") or "unknown"
			return {
				"Welcome back, " .. username,
				datetime,
				" Neovim is to code, are you?" }
		end,
	},
})
