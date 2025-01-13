return {
	{
		"hrsh7th/nvim-cmp",
		enabled = true,
		lazy = false,
		event = "InsertEnter",
		dependencies = {
			{
				{
					"L3MON4D3/LuaSnip",
					build = "make install_jsregexp",
					dependencies = {
						"saadparwaiz1/cmp_luasnip",
						"rafamadriz/friendly-snippets",
					},
					opts = {
						history = true,
					},
				},
			},
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"mlaursen/vim-react-snippets",

			-- For ultisnips users.
			--"SirVer/ultisnips"
			--"quangnguyen30192/cmp-nvim-ultisnips"
		},

		config = function()
			--require("vim-react-snippets").lazy_load()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup {
				require("luasnip.loaders.from_vscode").lazy_load()
			}

			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "codeium" },
					{ name = "luasnip" },
					{ name = "path" },
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

