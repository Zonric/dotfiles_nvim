return {
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 999,
		config = function()
			vim.cmd.colorscheme "nightfox"
			vim.api.nvim_set_hl(0, "CursorLine", { bg = "#131a24", underline = true, })
		end,
	},
}

