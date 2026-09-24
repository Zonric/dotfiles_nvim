local acp_script = vim.fn.stdpath("config") .. "/scripts/agy-acp"

return {
	{
		"olimorris/codecompanion.nvim",
		version = "^19.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			adapters = {
				acp = {
					antigravity = function()
						return {
							name = "antigravity",
							formatted_name = "Antigravity CLI",
							type = "acp",
							roles = {
								llm = "assistant",
								user = "user",
							},
							commands = {
								default = {
									acp_script,
								},
							},
							defaults = {
								timeout = 60000,
							},
							parameters = {
								protocolVersion = 1,
								clientCapabilities = {
									fs = { readTextFile = true, writeTextFile = true },
								},
								clientInfo = {
									name = "CodeCompanion.nvim",
									version = "1.0.0",
								},
							},
							handlers = {
								setup = function()
									return true
								end,
								form_messages = function(self, messages, capabilities)
									return require("codecompanion.adapters.acp.helpers").form_messages(
										self,
										messages,
										capabilities
									)
								end,
							},
						}
					end,
				},
			},
			interactions = {
				chat = {
					adapter = "antigravity",
					opts = {
						completion_provider = "blink",
					},
				},
				inline = {
					adapter = "antigravity",
				},
				cli = {
					agent = "antigravity",
					agents = {
						antigravity = {
							cmd = "agy",
							args = {},
							description = "Antigravity CLI",
							provider = "terminal",
						},
					},
					opts = {
						auto_insert = true,
						reload = true,
					},
				},
			},
			display = {
				chat = {
					window = {
						layout = "vertical",
						width = 0.35,
						opts = {
							number = false,
							relativenumber = false,
						},
					},
				},
			},
			opts = {
				log_level = "DEBUG",
			},
		},
	},
}
