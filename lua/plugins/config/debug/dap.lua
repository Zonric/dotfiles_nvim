local dap = require "dap"
local dapui = require "dapui"

require("mason-nvim-dap").setup {
	automatic_installation = true,
	handlers = {},
	ensure_installed = {
		"delve",
	},
}
---@diagnostic disable-next-line: missing-fields
dapui.setup {
	icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
	---@diagnostic disable-next-line: missing-fields
	controls = {
		icons = {
			pause = "⏸",
			play = "▶",
			step_into = "⏎",
			step_over = "⏭",
			step_out = "⏮",
			step_back = "b",
			run_last = "▶▶",
			terminate = "⏹",
			disconnect = "⏏",
		},
	},
}
dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close
require("dap-go").setup {
	delve = {
		detached = vim.fn.has "win32" == 0,
	},
}
