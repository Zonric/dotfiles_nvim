return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has "win32" == 1 or vim.fn.executable "make" == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup {}

			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				sources = {
					{ name = "nvim_lsp" },
					{ name = "codeium" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			}
			--cmdline?
			--lspconfig capabilities ?
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			require('lspconfig')['clangd'].setup {
				capabilities = capabilities
			}
			require('lspconfig')['lua_ls'].setup {
				capabilities = capabilities
			}
			require('lspconfig')['ts_ls'].setup {
				capabilities = capabilities
			}
			require('lspconfig')['clangd'].setup {
				capabilities = capabilities
			}
		end,
	},
}

