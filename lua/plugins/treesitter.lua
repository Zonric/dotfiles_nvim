return {
	{
		"nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
		enabled = true,
		lazy = false,
		opts = {
			ensure_installed = {
				"bash", "c", "cpp", "css", "diff",
				"go", "html", "javascript", "jsdoc",
				"json", "jsonc", "lua", "luadoc",
				"markdown", "markdown_inline", "printf",
				"python", "query", "regex", "ruby", "sql", "toml",
				"tsx", "typescript", "vim", "vimdoc", "xml", "yaml",
			},
			sync_install = false,
			auto_install = true,
			highlight = { enable = true },
      indent = { enable = true },
		},
	},
}

