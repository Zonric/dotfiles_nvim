return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = not vim.g.is_server,
		lazy = true,
		ft = { "markdown" },
		cmd = "RenderMarkdown",
		opts = {},
	},
}
