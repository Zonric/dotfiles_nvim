return {
	{
		"https://gitlab.com/nullsyntax/codecopy.nvim.git",
		enabled = true,
		lazy = true,
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			keymap = "<leader>cc",
		}
	}
}
