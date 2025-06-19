require("supermaven-nvim").setup({
	keymaps = {
		accept_suggestion = "<C-y>",
		clear_suggestion = "<C-e>",
		accept_word = "<C-l>",
	},
	color = {
		suggestion_color = "#4C6470",
		cterm = 244,
	},
	disable_inline_completion = true,
})
