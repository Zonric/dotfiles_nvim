return {

	{
		"williamboman/mason.nvim",
		enabled = true,
		event = "VeryLazy",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			ensure_installed = {
				"asm_lsp", "awk_ls", "bashls", "beautysh", "black",
				"blade-formatter", "clangd", "codelldb", "cssls",
				"emmet-ls", "eslint_d", "glsl_analyzer", "glslls",
				"gopls", "html", "htmx", "intelephense", "jdtls",
				"jsonls", "lua_ls", "marksman", "mesonlsp", "neocmake",
				"nginx-language-server", "php-debug-adapter", "phpactor",
				"phpstan", "pint", "powershell_es", "prettierd", "pyright",
				"rust_analyzer", "rustywind", "shellcheck", "sqlls",
				"stimulus_ls", "stylua", "svelte",
				"tailwindcss-language-server", "ts_ls",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			{
				"folke/lazydev.nvim",
				enabled = true,
				event = "VeryLazy",
				ft = "lua",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		opts = {
			automatic_installation = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		dependencies = {
			"saghen/blink.cmp",
		},
		opts = {},
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.asm_lsp.setup({ capabilities = capabilities })
			lspconfig.awk_ls.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.emmet_ls.setup({ capabilities = capabilities })
			lspconfig.glsl_analyzer.setup({
				capabilities = capabilities,
				filetypes = { "comp", "frag", "geom", "tesc", "tese", "vert", "glsl" },
			})
			lspconfig.glslls.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.htmx.setup({ capabilities = capabilities })
			lspconfig.intelephense.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.marksman.setup({ capabilities = capabilities })
			lspconfig.mesonlsp.setup({ capabilities = capabilities })
			lspconfig.neocmake.setup({ capabilities = capabilities })
			lspconfig.phpactor.setup({ capabilities = capabilities })
			lspconfig.powershell_es.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.sqlls.setup({ capabilities = capabilities })
			lspconfig.stimulus_ls.setup({ capabilities = capabilities })
			lspconfig.svelte.setup({ capabilities = capabilities })
			lspconfig.tailwindcss.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		enabled = true,
		event = "VeryLazy",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		opts = {},
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.completion.spell,
					require("none-ls.diagnostics.eslint_d"),
					null_ls.builtins.diagnostics.rubocop,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.rubocop,
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
}

