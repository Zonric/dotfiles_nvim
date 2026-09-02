return {
	{
		"mason-org/mason.nvim",
		enabled = true,
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

					local allowed = { lua_ls = true }
					if not allowed[client.name] then
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
		opts = {
			ensure_installed = {
				"bashls",
				"clangd",
				"cssls",
				"html",
				"intelephense",
				"laravel_ls",
				"lua_ls",
				"phpactor",
				"pyright",
				"twiggy_language_server",
				"gopls",
			},
			automatic_enable = true,
		},
	},
}
