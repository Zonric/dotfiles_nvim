return {
	"echasnovski/mini.nvim",
	lazy = false,
	enabled = true,
	config = function ()
		require('mini.pairs').setup()
	end,
}
