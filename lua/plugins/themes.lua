return {
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme carbonfox")
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#FFFFFF"})
		end,
	},
}
