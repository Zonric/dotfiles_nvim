if true then
	return {}
end

return {
	{
		"github/plugin.nvim",
		--version = "*"
		enabled = true,
		lazy = true,
		--event = "VeryLazy",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {},
		opts = {}
		--config = function() require(plugins/config/template) end,
	},
}
