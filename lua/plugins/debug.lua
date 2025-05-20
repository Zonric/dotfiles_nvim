return {
	{
		"mfussenegger/nvim-dap",
		enabled = true,
		lazy = false,
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"leoluz/nvim-dap-go",
		},
		config = function()
			require("plugins/config/debug")
		end,
	},
}
