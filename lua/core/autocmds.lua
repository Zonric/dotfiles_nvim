vim.cmd([[
	autocmd BufNewFile,BufRead *.vert set filetype=GLSL
	autocmd BufNewFile,BufRead *.frag set filetype=GLSL
	autocmd BufNewFile,BufRead *.comp set filetype=GLSL
]])

local augroup = require("core.module.groups")

vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup.create("highlight_yank"),
	callback = function()
		(vim.hl or vim.highlight).on_yank()
	end,
})

-- resize splits if window got resized and set help back to 80
vim.api.nvim_create_autocmd("VimResized", {
	group = augroup.create("equalize_nonhelp"),
	callback = function()
		for tab = 1, vim.fn.tabpagenr("$") do
			vim.api.nvim_set_current_tabpage(tab)
			local help_wins = {}
			local normal_wins = {}
			for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
				local buf = vim.api.nvim_win_get_buf(win)
				local ft = vim.bo[buf].filetype
				if ft == "help" then
					table.insert(help_wins, win)
				else
					table.insert(normal_wins, win)
				end
			end
			if #normal_wins > 1 then
				vim.cmd("tabdo wincmd =")
			end
			for _, win in ipairs(help_wins) do
				vim.api.nvim_set_current_win(win)
				vim.cmd("vertical resize 80")
			end
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup.create("help_placement"),
	pattern = "help",
	callback = function()
		if vim.fn.winwidth(0) > vim.fn.winheight(0) then
			vim.cmd("wincmd L")
			vim.cmd("vertical resize 80")
		end
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup.create("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"dbout",
		"gitsigns-blame",
		"grug-far",
		"help",
		"lspinfo",
		"neotest-output",
		"neotest-output-panel",
		"neotest-summary",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
				desc = "Quit buffer",
			})
		end)
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = augroup.create("remove_star_comment"),
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	group = augroup.create("Format_on_save"),
-- 	pattern = "*",
-- 	callback = function(args)
-- 		require("conform").format({ bufnr = args.buf })
-- 	end,
-- })

vim.api.nvim_create_autocmd({ "bufRead", "BufNewFile" }, {
	pattern = ".bladeformatterrc",
	callback = function()
		vim.bo.filetype = "json"
	end,
})
