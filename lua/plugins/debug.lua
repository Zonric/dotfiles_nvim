return {
	{
		"mfussenegger/nvim-dap",
		enabled = true,
		lazy = false,
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",
			"jbyuki/one-small-step-for-vimkind",
		},
		config = function()
			require("plugins.config.debug.dap")
		end,
	},
}
