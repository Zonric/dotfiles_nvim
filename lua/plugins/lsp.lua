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
				"angularls", "asm_lsp", "awk_ls", "bashls", "clangd", "neocmake", "csharp_ls",
				"cssls", "dockerls", "glsl_analyzer", "gopls", "html", "htmx",
				"intelephense", "jdtls", "jsonls", "lua_ls", "marksman", "mesonlsp",
				"powershell_es", "pyright", "rust_analyzer", "sqlls",
				"svelte", "ts_ls",
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		enabled = true,
		lazy = false,
		opts = {},
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})
		end,
	},
}

