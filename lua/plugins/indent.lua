return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	priority = 1,
  enabled = true,
  lazy = false,
  opts = {
		chunk = {
			enable = true,
			style = {
				{ fg = "#C3802B" },
			},
		},
		indent = {
			enable = true,
			style = {
				{ fg = "#1D2C8B" },
			},
		},
		line_num = {
			enable = true,
			style = "#0AB7FF",
		},
		blank = {
			enable = false,
		},
	},
}

