-- Highlight yanked text.
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Pin help window to left v split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	callback = function(args)
		vim.bo[args.buf].bufhidden = "unload"
		local win = vim.api.nvim_get_current_win()
		vim.cmd("wincmd L")
		vim.api.nvim_win_set_width(win, 80)
		vim.wo[win].winfixwidth = true
	end,
})

-- Add esc to close mini.files
vim.api.nvim_create_autocmd("User", {
	pattern = "MiniFilesBufferCreate",
	callback = function(args)
		vim.keymap.set("n", "<Esc>", function() require("mini.files").close() end, {
			buffer = args.data.buf_id,
		})
	end,
})

