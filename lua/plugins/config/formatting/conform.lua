require("conform").setup({
	formatters_by_ft = {
		c = { "clang_format" },
		cpp = { "clang_format" },
		cmake = { "cmake_format" },
		lua = { "stylua" },
		markdown = { "prettierd" },
		python = { "black" },
		php = { "php-cs-fixer" },
		blade = { "blade-formatter" },
		html = { "prettierd" },
		css = { "prettierd" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
	},
	formatters = {
		["clang_format"] = {
			prepend_args = { "--style=file" },
		},
		["prettierd"] = {
			command = "prettierd",
			args = { "$FILENAME" },
			stdin = true,
		},
		["blade-formatter"] = {
			command = "blade-formatter",
			args = { "--stdin" },
			stdin = true,
		},
		["php_cs_fixer"] = {
			command = "php-cs-fixer",
			args = { "fix", "--using-cache=no", "--quiet", "$FILENAME" },
			stdin = false,
			condition = function()
				vim.g.conform_log_level = "debug"
				return vim.fn.exectuable("php-cs-fixer") == 1
			end,
		},
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 375,
	},
	notify_on_error = false,
})
