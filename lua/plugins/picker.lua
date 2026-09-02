return {
	{
		"ibhagwan/fzf-lua",
		enabled = true,
		lazy = true,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("fzf-lua").register_ui_select()
		end,
	},
}
