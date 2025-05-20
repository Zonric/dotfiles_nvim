return {
	{
		"echasnovski/mini.files",
		enabled = true,
		lazy = false,
		opts = {
			mappings = {
				close = "q",
				go_in = "L",
				go_in_plus = "l",
				go_out = "H",
				go_out_plus = "h",
				mark_goto = "'",
				mark_set = "m",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
		},
	},
	{
		"echasnovski/mini.splitjoin",
		enabled = true,
		lazy = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {},
	},
}
