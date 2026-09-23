return {
	{
		"romus204/tree-sitter-manager.nvim",
		enabled = true,
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			ensure_installed = {
				"go",
				"gomod",
				"gosum",
				"gowork",
				"javascript",
				"markdown",
				"markdown_inline",
				"templ",
				"tsx",
				"typescript",
			},
			auto_install = true,
			noauto_install = {},
			nohighlight = {},
		}
	},
}
