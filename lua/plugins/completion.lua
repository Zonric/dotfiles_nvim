return {
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		lazy = false,
		event = "InsertEnter",
		dependencies = {
			{
				{
					"folke/lazydev.nvim",
					ft = "lua",
					opts = {
						library = {
							{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
							{ path = "lazy.nvim", words = { "LazyVim" } },
						},
					},
				},{
					"L3MON4D3/LuaSnip",
					build = "make install_jsregexp",
					dependencies = {
						"saadparwaiz1/cmp_luasnip",
						"rafamadriz/friendly-snippets",
					},
					opts = {
						history = true,
					},
				},{
					"onsails/lspkind.nvim",
					opts = {
						mode = "symbol_text",
						preset = "codicons",
						symbol_map = {
							Text = "󰉿", Method = "󰆧", Function = "󰊕",
							Constructor = "", Field = "󰜢", Variable = "󰀫",
							Class = "󰠱", Interface = "", Module = "", Property = "󰜢",
							Unit = "󰑭", Value = "󰎠", Enum = "", Keyword = "󰌋",
							Snippet = "", Color = "󰏘", File = "󰈙", Reference = "󰈇",
							Folder = "󰉋", EnumMember = "", Constant = "󰏿", Struct = "󰙅",
							Event = "", Operator = "󰆕", TypeParameter = "", Codeium = "󰆨",
						},
					},
				},
			},
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")
			luasnip.config.setup {
				require("luasnip.loaders.from_vscode").lazy_load()
			}

			cmp.setup {
---@diagnostic disable-next-line: missing-fields
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol_text',
						maxwidth = {
							menu = 50,
							abbr = 50,
						},
						ellipsis_char = '...',
						show_labelDetails = true,
---@diagnostic disable-next-line: unused-local
						before = function (entry, vim_item)
							return vim_item
						end
					})
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "lazydev", group_index = 0, },
					{ name = "codeium" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "emoji" },
				},{
					{ name = "buffer" },
				}),
			}
			--cmdline?
			--lspconfig capabilities ?
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require('lspconfig')['clangd'].setup { capabilities = capabilities }
			require('lspconfig')['lua_ls'].setup { capabilities = capabilities }
			require('lspconfig')['ts_ls'].setup {	capabilities = capabilities }
			require('lspconfig')['clangd'].setup { capabilities = capabilities }
		end,
	},
}

