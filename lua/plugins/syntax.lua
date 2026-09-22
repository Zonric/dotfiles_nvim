return {
	{
		"romus204/tree-sitter-manager.nvim",
		enabled = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"javascript",
				"markdown",
				"markdown_inline",
				"tsx",
				"typescript",
			},
			auto_install = true,
			noauto_install = {},
			nohighlight = {},
		}
	},
}
