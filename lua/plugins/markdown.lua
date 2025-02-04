return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},{
		"toppair/peek.nvim",
		event = "VeryLazy",
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				app = "browser",
			})
			local peek = require("peek")
			vim.api.nvim_create_user_command("PeekToggle", function()
				if not peek.is_open() and vim.bo[vim.api.nvim_get_current_buf()].filetype == "markdown" then
					peek.open()
				else
					peek.close()
				end
			end, {})
		end,
	}
}
