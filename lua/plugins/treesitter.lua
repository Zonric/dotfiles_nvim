return {
	{
		"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
		enabled = true,
		lazy = false,
		opts = {
			ensure_installed = { "c", "cpp", "lua", "go",
				"python", "markdown", "markdown_inline",
				"bash", "json", "yaml", "html", "css",
				"javascript", "typescript", "sql", "tsx"
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
      indent = { enable = true },
		},
	},
}

