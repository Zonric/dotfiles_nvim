return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		enable = true,
		init = function()
			vim.notify = require("notify")
		end,
	},
}
