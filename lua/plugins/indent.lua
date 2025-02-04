return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	priority = 1,
  enabled = false,
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
			enable = false,
			style = "#0AB7FF",
		},
		blank = {
			enable = false,
		},
	},
}

