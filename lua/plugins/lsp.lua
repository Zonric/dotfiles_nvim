return {
	{
		"mason-org/mason.nvim",
		enabled = true,
		cmd = "Mason",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
			-- "ray-x/lsp_signature.nvim",
		},
		opts = {},
		config = function()
			-- Selectivly allow LSP formatting capabilities.
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client or not client.server_capabilities then
						return
					end

					local disallowed = {
						ts_ls = true,
					}
					if disallowed[client.name] then
						client.server_capabilities.documentFormattingProvider = false
						client.server_capabilities.documentRangeFormattingProvider = false
					end
				end,
			})
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		enabled = true,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			ensure_installed = {
				"bashls",
				"clangd",
				"cssls",
				"eslint",
				"gopls",
				"html",
				"intelephense",
				"laravel_ls",
				"lua_ls",
				"phpactor",
				"pyright",
				"tailwindcss",
				"ts_ls",
				"twiggy_language_server",
			},
			automatic_enable = true,
		},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
