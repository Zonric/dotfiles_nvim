vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})
			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end
	end,
})
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			if diagnostic.code then
				return string.format("%s [%s]", diagnostic_message[diagnostic.severity], diagnostic.code)
			else
				return diagnostic_message[diagnostic.severity]
			end
		end,
	},
})

local ensure_installed = vim.tbl_keys({})
vim.list_extend(ensure_installed, {
	"pyright",
	"cpptools",
	"clangd",
	"intelephense",
	"blade-formatter",
	"stylua",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
require("mason-lspconfig").setup({
	ensure_installed = {}, -- explicitly set to an empty table
	automatic_installation = true,
	automatic_enable = false,
})

local lspconfig = require("lspconfig")
lspconfig.gopls.setup({})
lspconfig.lua_ls.setup({ settings = { Lua = { completion = { callSnippet = "Replace" } } } })
lspconfig.html.setup({ filetypes = { "html", "blade" } })
lspconfig.intelephense.setup({
	filetypes = { "php", "blade" },
	settings = {
		intelephense = {
			environment = {},
			format = {
				braces = "k&r",
				quotes = "double",
			},
		},
	},
})
lspconfig.marksman.setup({})
