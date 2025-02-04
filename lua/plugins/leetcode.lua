local leet_arg = "leetcode.nvim"
return {
	"kawre/leetcode.nvim",
  enabled = true,
	build = ":TSUpdate html",
	lazy = leet_arg ~= vim.fn.argv(0, -1),
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"ibhagwan/fzf-lua",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
	},
  opts = {
		arg = leet_arg,
		lang = "cpp",
		logging = true,
	},
}
