return {

	{
		"williamboman/mason.nvim",
		enabled = true,
		lazy = false,
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		enabled = true,
		lazy = false,
		opts = {
			ensure_installed = {
				"angularls", "asm_lsp", "awk_ls", "bashls",
				"clangd", "cssls", "glsl_analyzer", "gopls",
				"html", "htmx", "jdtls", "jsonls", "lua_ls",
				"marksman", "mesonlsp", "neocmake", "phpactor",
				"powershell_es", "pyright", "rust_analyzer",
				"sqlls", "svelte", "ts_ls",
			},
		},
	}, {
		"nvimtools/none-ls.nvim",
		enabled = true,
		lazy = false,
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
	}, {
		"neovim/nvim-lspconfig",
		enabled = true,
		lazy = false,
		opts = {},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.angularls.setup({ capabilities = capabilities })
			lspconfig.asm_lsp.setup({ capabilities = capabilities })
			lspconfig.awk_ls.setup({ capabilities = capabilities })
			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({ capabilities = capabilities })
			lspconfig.glsl_analyzer.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.html.setup({ capabilities = capabilities })
			lspconfig.htmx.setup({ capabilities = capabilities })
			lspconfig.jdtls.setup({ capabilities = capabilities })
			lspconfig.jsonls.setup({ capabilities = capabilities })
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.marksman.setup({ capabilities = capabilities })
			lspconfig.mesonlsp.setup({ capabilities = capabilities })
			lspconfig.phpactor.setup({ capabilities = capabilities })
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })
			lspconfig.sqlls.setup({ capabilities = capabilities })
			lspconfig.svelte.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })
		end,
	},
}
