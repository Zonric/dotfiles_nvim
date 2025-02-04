return {
	{
		"mfussenegger/nvim-dap",
		enabled = true,
		event = "VeryLazy",
		config = function()
			local dap = require("dap")
			dap.adapters.codelldb = {
				type = "executable",
				command = "codelldb",
			}
			-- dap.configurations.cpp = {
			-- 	{
			-- 		name = "NewLaunch",
			-- 		type = "codelldb",
			-- 		request = "launch",
			-- 		program = function()
			-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- 		end,
			-- 		cwd = "${workspaceFolder}",
			-- 		stopOnEntry = false,
			-- 		args = {},
			-- 	},
			-- }
		end
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
    opts = {},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end
	},
}
