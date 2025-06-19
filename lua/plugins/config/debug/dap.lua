local dap = require("dap")
local dapui = require("dapui")

require("mason-nvim-dap").setup {
	automatic_installation = true,
	handlers = {},
	ensure_installed = {
		"delve",
	},
}

---@diagnostic disable-next-line: missing-fields
require("dapui").setup({})
-- require("dap-cs").setup({})

require("nvim-dap-virtual-text").setup({
	-- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
	display_callback = function(variable)
		local name = string.lower(variable.name)
		local value = string.lower(variable.value)
		if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
			return "*****"
		end

		if #variable.value > 15 then
			return " " .. string.sub(variable.value, 1, 15) .. "... "
		end

		return " " .. variable.value
	end,
})

dap.configurations.lua = {{
	type = "nlua",
	request = "attach",
	name = "Attach to running Neovim instance",
}}

dap.adapters.nlua = function(callback, config)
	callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
end

-- Handled by nvim-dap-go
-- dap.adapters.go = {
--   type = "server",
--   port = "${port}",
--   executable = {
--     command = "dlv",
--     args = { "dap", "-l", "127.0.0.1:${port}" },
--   },
-- }

-- local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
-- if elixir_ls_debugger ~= "" then
-- 	dap.adapters.mix_task = {
-- 		type = "executable",
-- 		command = elixir_ls_debugger,
-- 	}
--
-- 	dap.configurations.elixir = {
-- 		{
-- 			type = "mix_task",
-- 			name = "phoenix server",
-- 			task = "phx.server",
-- 			request = "launch",
-- 			projectDir = "${workspaceFolder}",
-- 			exitAfterTaskReturns = false,
-- 			debugAutoInterpretAllModules = false,
-- 		},
-- 	}
-- end

dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function()	dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function()	dapui.close() end

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
