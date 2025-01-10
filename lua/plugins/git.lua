return {
	{
		"lewis6991/gitsigns.nvim",
		enabled = true,
		lazy = false,
    config = function()
      require("gitsigns").setup()
    end,
	}
}
