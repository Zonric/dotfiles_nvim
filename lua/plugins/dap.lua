return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()
    require("nvim-dap-virtual-text").setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    -- dap.listeners.before.event_terminated.dapui_config = function()
    --   dapui.close()
    -- end
    --
    -- dap.listeners.before.event_exited.dapui_config = function()
    --   dapui.close()
    -- end

		-- C/CPP lldb configs
		vim.fn.sign_define('DapBreakpoint', {text='🔴', texthl='DapBreakpoint', linehl='', numhl=''})
		vim.fn.sign_define('DapStopped', {text='➡️', texthl='DapStopped', linehl='DebugLineHL', numhl=''})
		vim.fn.sign_define('DapBreakpointCondition', {text='🔶', texthl='DapBreakpoint', linehl='', numhl=''})
		vim.fn.sign_define('DapBreakpointRejected', {text='⚠️', texthl='DapBreakpoint', linehl='', numhl=''})
		dap.adapters.lldb = {
			type = "executable",
			command = "lldb-dap",
			name = "lldb",
		}
		dap.adapters.gdb = {
			type = "executable",
			command = "gdb",
			args = { "-i", "dap" }
		}

		dap.configurations.cpp = {
			{
				name = "Launch gdb",
				type = "gdb",
				request = "launch",
				program = function()
					return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				sourceMap = {
					[vim.fn.getcwd() .. "/src"] = "src",
				},
				stopOnEntry = false,
				args = {},
			},
			{
				name = "Launch lldb",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/build/", "file")
				end,
				cwd = "${workspaceFolder}",
				sourceMap = {
					[vim.fn.getcwd() .. "/src"] = "src",
				},
				stopOnEntry = false,
				args = {},
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp

	end,
}
