return {
	"akinsho/bufferline.nvim",
	enabled = true,
	lazy = false,
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {{
					filetype = "neo-tree",
					text = "File Explorer",
					text_align = "center",
					separator = true
				}},
			}
		})
	end,
}

