return {
	{
		"saghen/blink.cmp",
		enabled = true,
		version = "1.*",
		dependencies = {
			"saghen/blink.lib",
			"L3MON4D3/LuaSnip",
			"MahanRahmati/blink-nerdfont.nvim",
			"moyiz/blink-emoji.nvim"
		},
		build = function()
			require("blink.cmp").build():pwait()
		end,
		opts = {
			keymap = { preset = "default" },
			completion = {
				menu = {
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", "label_description", gap = 1 },
							{ "source_name" },
						},
					},
				},
				documentation = {
					auto_show = false,
				},
				ghost_text = { enabled = true },
			},
			snippets = {
				preset = "luasnip",
			},
			sources = {
				default = {
					"lsp", "path", "buffer", "snippets",  "nerdfont", "emoji"
				},
				providers = {
					lsp = { name = "LSP" },
					buffer = { name = "Buf" },
					path = { name = "Path" },
					snippets = { name = "Snip" },
					nerdfont = {
						module = "blink-nerdfont",
						name = "NerdFont",
						score_offset = 15,
						opts = { insert = true },
					},
					emoji = {
						module = "blink-emoji",
						name = "Emoji",
						score_offset = 15,
						opts = { insert = true },
					},
				},
			},
			fuzzy = {
				implementation = "rust",
				sorts = {
					"exact",
					"score",
					"sort_text",
				},
			},
			signature = {
				enabled = true,
				window = { border = "rounded" },
			},
		},
	},
}
