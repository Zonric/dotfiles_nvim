return {
	{
		"nvim-neotest/neotest",
		enabled = true,
		lazy = true,
		cmd = { "Neotest" },
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"marilari88/neotest-vitest",
			"nvim-neotest/neotest-jest",
			"fredrikaverpil/neotest-golang",
			"nvim-neotest/neotest-python",
		},
		opts = function()
			return {
				adapters = {
					require("neotest-vitest"),
					require("neotest-jest")({
						jestConfigFile = function()
							local file = vim.fn.expand("%:p")
							if string.find(file, "/packages/") then
								return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
							end
							return vim.fn.getcwd() .. "/jest.config.ts"
						end,
						cwd = function()
							return vim.fn.getcwd()
						end,
					}),
					require("neotest-golang"),
					require("neotest-python")({
						dap = { justMyCode = false },
					}),
				},
				status = { virtual_text = true },
				output = { open_on_run = false },
			}
		end,
		config = function(_, opts)
			require("neotest").setup(opts)
		end,
	},
}
