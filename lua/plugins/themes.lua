return {
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd("colorscheme carbonfox")
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#FFFFFF" })
			vim.api.nvim_set_hl(0, "MiniCursorword", { fg = "#ff7eb6", bold = true, underline = true })
			vim.api.nvim_set_hl(0, "MiniCursorwordCurrent", { fg = "#ff7eb6", bold = true, underline = true })
		end,
	},
}
