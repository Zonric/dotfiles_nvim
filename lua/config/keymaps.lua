--- LEADERLESS KEYS ---
--- Dap Keys
vim.keymap.set("n", "<F8>", function() require("dap").continue() end)
vim.keymap.set("n", "<F9>", function() require("dap").step_over() end)
vim.keymap.set("n", "<F10>", function() require("dap").step_into() end)
vim.keymap.set("n", "<F11>", function() require("dap").step_out() end)

-- Navigation
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })
-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition." })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration." })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references." })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation." })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Display LSP hover info." })

--- Alt +
vim.keymap.set("n", "<A-h>", "<h", { desc = "Decrease indentation on line." })
vim.keymap.set("v", "<A-h>", "<gv", { desc = "Decrease indentation on line." })
vim.keymap.set("n", "<A-j>", "<CMD>execute 'move .+' . v:count1<CR>==", { desc = "Move line down" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("i", "<A-j>", "<esc><CMD>m .+1<CR>==gi", { desc = "Move line down" })
vim.keymap.set("n", "<A-k>", "<CMD>execute 'move .-' . (v:count1 + 1)<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("i", "<A-k>", "<esc><CMD>m .-2<CR>==gi", { desc = "Move line up" })
vim.keymap.set("n", "<A-l>", ">l", { desc = "Increase indentation on line." })
vim.keymap.set("v", "<A-l>", ">gv", { desc = "Increase indentation on line." })

--- Control +
vim.keymap.set("n", "<C-/>", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].buftype == "terminal" then
			vim.api.nvim_set_current_win(win)
			vim.cmd("startinsert")
			return
		end
	end
	vim.cmd("botright split")
	vim.api.nvim_win_set_height(0, math.floor(vim.o.lines * 0.35))
	vim.cmd("term")
	vim.cmd("startinsert")
end, { desc = "Open Terminal."})
vim.keymap.set("t", "<C-/>", "<C-\\><C-n><C-w>k", { desc = "Exit Terminal."})
vim.keymap.set("n", "<C-BS>", "<CMD>noh<CR>", { desc = "Clear Search" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Navigate to Left Window." })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Navigate Down a Window." })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Navigate Up a Window." })
vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Display signature helper." })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Navigate to Right Window." })

-- LuaSnip Jumpable
vim.keymap.set({"i", "s"}, "<C-h>", function()
	if require("luasnip").jumpable(-1) then
		require("luasnip").jump(-1)
	end
end, { silent = true, desc = "Jump backward (snip)" })
vim.keymap.set({"i", "s"}, "<C-l>", function()
	if require("luasnip").expand_or_jumpable() then
		require("luasnip").expand_or_jump()
	end
end, { silent = true, desc = "Jump forward (snip)" })

-- LuaSnip choice cycles
vim.keymap.set({"i","s"}, "<C-n>", function()
	if require("luasnip").choice_active() then
		require("luasnip").change_choice(1)
	end
end, { silent = true, desc = "Cycle Choice forward (snip)"})
vim.keymap.set({"i","s"}, "<C-p>", function()
	if require("luasnip").choice_active() then
		require("luasnip").change_choice(-1)
	end
end, { silent = true, desc = "Cycle Choice forward (snip)"})

--- Control + Alt +
vim.keymap.set("n", "<C-A-h>", "<CMD>vertical resize -15<CR>", { desc = "Decrease vertical split size." })
vim.keymap.set("n", "<C-A-j>", "<CMD>horizontal resize -1<CR>", { desc = "Decrease horizontal split size." })
vim.keymap.set("n", "<C-A-k>", "<CMD>horizontal resize +1<CR>", { desc = "Increase horizontal split size." })
vim.keymap.set("n", "<C-A-l>", "<CMD>vertical resize +15<CR>", { desc = "Increase vertical split size." })

--- Control + Shift +
vim.keymap.set("n", "<C-S-L>", "<CMD>BufferLineMoveNext<CR>", { desc = "Move buffer right." })
vim.keymap.set("n", "<C-S-h>", "<CMD>BufferLineMovePrev<CR>", { desc = "Move buffer left." })

--- Shift +
vim.keymap.set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", { desc = "Next Buffer" })


--- LEADER KEYS ---
-- vim.keymap.set("n", "<leader>a", "", { desc = "<leader>a" })

vim.keymap.set("n", "<leader>b", "", { desc = "Buffer..." })
vim.keymap.set("n", "<leader>bd", "<CMD>bp|bd#<CR>", { desc = "delete." })
vim.keymap.set("n", "<leader>bo", "", { desc = "close others." })

vim.keymap.set("n", "<leader>c", "", { desc = "Code.." })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "actions." })
vim.keymap.set("n", "<leader>cc", "<CMD>CodeCopy<CR>", { desc = "Copy." })
vim.keymap.set("n", "<leader>cu", "<CMD>CodeCopy open ui<CR>", { desc = "Open CC UI." })
vim.keymap.set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "diagnostics." })

vim.keymap.set("n", "<leader>d", "", { desc = "Debug..." })
vim.keymap.set("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "Set Breakpoint." })
vim.keymap.set("n", "<leader>dB", function()
 require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional Breakpoint." })
vim.keymap.set("n", "<leader>dr", function() require("dap").repl.open() end, { desc = "Open Repl" })
vim.keymap.set("n", "<leader>du", function() require("dapui").toggle() end, { desc = "Toggle DAP UI" })

vim.keymap.set("n", "<leader>e", function()
	if not require("mini.files").close() then require("mini.files").open() end
end, { desc = "File Explorer" })

vim.keymap.set("n", "<leader>f", "", { desc = "Find..." })
vim.keymap.set("n", "<leader>fb", function() require("fzf-lua").buffers() end, { desc = "Buffers." })
vim.keymap.set("n", "<leader>fd", function() require("fzf-lua").diagnostics_document() end, { desc = "Diagnostic." })
vim.keymap.set("n", "<leader>ff", function() require("fzf-lua").files() end, { desc = "Files." })
vim.keymap.set("n", "<leader>fh", function() require("fzf-lua").help_tags() end, { desc = "Help Tags." })
vim.keymap.set("n", "<leader>fk", function() require("fzf-lua").keymaps() end, { desc = "Keymaps." })
vim.keymap.set("n", "<leader>fm", function() require("fzf-lua").manpages() end, { desc = "Man Pages." })
vim.keymap.set("n", "<leader>fr", function() require("fzf-lua").lsp_references() end, { desc = "LSP References." })
vim.keymap.set("n", "<leader>fs", function() require("fzf-lua").lsp_document_symbols() end, { desc = "LSP Symborls." })

vim.keymap.set("n", "<leader>g", "", { desc = "Git..." })
vim.keymap.set("n", "<leader>gb", function() require("fzf-lua").git_branches() end, { desc = "Branches." })
vim.keymap.set("n", "<leader>gB", function() require("fzf-lua").git_blame() end, { desc = "Blame." })
vim.keymap.set("n", "<leader>gc", function() require("fzf-lua").git_commits() end, { desc = "Commit logs." })
vim.keymap.set("n", "<leader>gd", function() require("fzf-lua").git_diff() end, { desc = "Diff." })
vim.keymap.set("n", "<leader>gs", function() require("fzf-lua").git_status() end, { desc = "Status." })
vim.keymap.set("n", "<leader>gl", "<CMD>LazyGit<CR>", { desc = "LazyGit." })

-- vim.keymap.set("n", "<leader>h", "", { desc = "<leader>h" })
-- vim.keymap.set("n", "<leader>i", "", { desc = "<leader>i" })
-- vim.keymap.set("n", "<leader>j", "", { desc = "<leader>j" })
-- vim.keymap.set("n", "<leader>k", "", { desc = "<leader>k" })
-- vim.keymap.set("n", "<leader>l", "", { desc = "<leader>l" })
-- vim.keymap.set("n", "<leader>m", "", { desc = "<leader>m" })
-- vim.keymap.set("n", "<leader>n", "", { desc = "<leader>n" })
-- vim.keymap.set("n", "<leader>o", "", { desc = "<leader>o" })
-- vim.keymap.set("n", "<leader>p", "", { desc = "<leader>p" })
-- vim.keymap.set("n", "<leader>q", "", { desc = "<leader>q" })
-- vim.keymap.set("n", "<leader>r", "", { desc = "<leader>r" })

vim.keymap.set("n", "<leader>s", "", { desc = "Search..." })
vim.keymap.set("n", "<leader>sb", function() require("fzf-lua").lgrep_curbuf() end, { desc = "current Buffer" })
vim.keymap.set("n", "<leader>sf", function() require("fzf-lua").live_grep() end, { desc = "Files." })
vim.keymap.set("n", "<leader>sk", function() require("fzf-lua").keymaps() end, { desc = "Keymaps." })
vim.keymap.set("n", "<leader>sw", function() require("fzf-lua").grep_cword() end, { desc = "Word under cursor." })

-- vim.keymap.set("n", "<leader>t", "", { desc = "<leader>t" })
-- vim.keymap.set("n", "<leader>u", "", { desc = "<leader>u" })
-- vim.keymap.set("n", "<leader>v", "", { desc = "<leader>v" })
-- vim.keymap.set("n", "<leader>w", "", { desc = "<leader>w" })

vim.keymap.set("n", "<leader>x", "", { desc = "Trouble..." })
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (project)" })
vim.keymap.set("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Diagnostics (buffer)" })
vim.keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { desc = "Symbols" })
vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix" })

-- vim.keymap.set("n", "<leader>y", "", { desc = "<leader>y" })
-- vim.keymap.set("n", "<leader>z", "", { desc = "<leader>z" })

