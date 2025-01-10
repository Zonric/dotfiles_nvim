return {
	{
		"EdenEast/nightfox.nvim",
		enabled = true,
		lazy = false,
		priority = 999,
		config = function()
			vim.cmd.colorscheme "nightfox"
		end,
	},
}
