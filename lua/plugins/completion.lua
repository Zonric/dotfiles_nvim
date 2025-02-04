return {
	{
		"saghen/blink.cmp",
		dependencies = "rafamadriz/friendly-snippets",
		version = "*",
		opts = {
			keymap = { preset = "default" },

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},{
		"Exafunction/codeium.nvim",
		enabled = true,
		dependencies = { "saghen/blink.compat" },
		event = "InsertEnter",
		build = ":Codeium Auth",
		opts = {
			enable_cmp_source = vim.g.ai_cmp,
			key_bindings = {
				accept = false,
			}
		}
	},{
		"onsails/lspkind.nvim",
		enabled = true,
		opts = {
			mode = "symbol_text",
			preset = "codicons",
			symbol_map = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
				Codeium = "󰆨",
			},
		},
	},
}
