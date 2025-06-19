require("mini.files").setup({
	mappings = {
		close = "q",
		go_in = "J",
		go_in_plus = "l",
		go_out = "K",
		go_out_plus = "h",
		mark_goto = "'",
		mark_set = "m",
		reset = "<BS>",
		reveal_cwd = "@",
		show_help = "g?",
		synchronize = "=",
		trim_left = "<",
		trim_right = ">",
	},
  options = {
    use_libuv_file_watcher = true,
	},

	vim.api.nvim_create_autocmd("User", {
		pattern = "MiniFilesBufferCreate",
		callback = function(args)
			local map_buf = function(lhs, rhs) vim.keymap.set("n", lhs, rhs, { buffer = args.data.buf_id }) end
			map_buf("<Esc>", MiniFiles.close)
		end,
	})
})
