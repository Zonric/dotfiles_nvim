return {
	"rcarriga/nvim-notify",
	enabled = true,
	lazy = false,
	init = function()
		vim.notify = require("notify")
	end,
	opts = {},
}

