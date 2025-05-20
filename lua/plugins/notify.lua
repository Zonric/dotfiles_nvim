return {
	{
		"rcarriga/nvim-notify",
		enabled = true,
		lazy = false,
		opts = {},
		config = function()
			vim.notify = require("notify")
		end,
	},
}
