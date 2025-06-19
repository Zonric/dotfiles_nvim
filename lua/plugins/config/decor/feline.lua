local line_ok, feline = pcall(require, "feline")
if not line_ok then
	return
end
local one_monokai = {
	fg = "#ABB2BF",
	bg = "#0D131A",
	green = "#98C379",
	yellow = "#E5C07B",
	purple = "#C678DD",
	orange = "#D19A66",
	peanut = "#F6D5A4",
	red = "#E06C75",
	aqua = "#61AFEF",
	darkblue = "#324359",
	dark_red = "#F75F5F",
}

local vi_mode_colors = {
	NORMAL = "green", -- #98C379
	OP = "green", -- #98C379
	INSERT = "yellow", -- #E5C07B
	VISUAL = "purple", -- #C678DD
	LINES = "orange", -- #D19A66
	BLOCK = "dark_red", -- #F75F5F
	REPLACE = "red", -- #E06C75
	COMMAND = "aqua", -- #61AFEF
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				fg = "bg",
				bg = require("feline.providers.vi_mode").get_mode_color(),
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "block",
		right_sep = "block",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "peanut",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "right_filled",
	},
	separator = {
		provider = "",
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "relative",
			},
		},
		hl = {
			style = "bold",
		},
		left_sep = " ",
		right_sep = " ",
	},
	file_size = {
		provider = {
			name = "file_size",
		},
		hl = {
			fg = "purple",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block"
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "red",
		},
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "yellow",
		},
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "aqua",
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "purple",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			fg = "red",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "orange",
			bg = "darkblue",
			style = "italic",
		},
		left_sep = "block",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = "green",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "aqua",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "yellow",
			style = "bold",
		},
	},
}

local left = {
	c.vim_mode,
	c.gitBranch,
	c.gitDiffAdded,
	c.gitDiffRemoved,
	c.gitDiffChanged,
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
}

local middle = {
	c.fileinfo,
	c.file_size,
}

local right = {
	c.lsp_client_names,
	c.file_type,
	c.file_encoding,
	c.position,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

feline.setup {
	components = components,
	theme = one_monokai,
	vi_mode_colors = vi_mode_colors,
}
