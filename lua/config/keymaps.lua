local set = vim.keymap.set
local fzf = require("fzf-lua")
local dap = require("dap")
local dapui = require("dapui")
local ls = require("luasnip")

--- LEADERLESS KEYS ---
--- Functions
--- Dap Keys
vim.keymap.set("n", "<F8>", dap.continue)
vim.keymap.set("n", "<F9>", dap.step_over)
vim.keymap.set("n", "<F10>", dap.step_into)
vim.keymap.set("n", "<F11>", dap.step_out)

-- Navigation
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })
-- LSP
set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition." })
set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration." })
set("n", "gr", vim.lsp.buf.references, { desc = "Go to references." })
set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation." })
set("n", "K", vim.lsp.buf.hover, { desc = "Display LSP hover info." })

--- Alt +
set("n", "<A-h>", "<h", { desc = "Decrease indentation on line." })
set("v", "<A-h>", "<gv", { desc = "Decrease indentation on line." })
set("n", "<A-j>", "<CMD>execute 'move .+' . v:count1<CR>==", { desc = "Move line down" })
set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<CR>gv=gv", { desc = "Move line down" })
set("i", "<A-j>", "<esc><CMD>m .+1<CR>==gi", { desc = "Move line down" })
set("n", "<A-k>", "<CMD>execute 'move .-' . (v:count1 + 1)<CR>==", { desc = "Move line up" })
set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<CR>gv=gv", { desc = "Move line up" })
set("i", "<A-k>", "<esc><CMD>m .-2<CR>==gi", { desc = "Move line up" })
set("n", "<A-l>", ">l", { desc = "Increase indentation on line." })
set("v", "<A-l>", ">gv", { desc = "Increase indentation on line." })

--- Control +
set("n", "<C-/>", function()
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
set("t", "<C-/>", "<C-\\><C-n><C-w>k", { desc = "Exit Terminal."})
set("n", "<C-BS>", "<CMD>noh<CR>", { desc = "Clear Search" })
set("n", "<C-h>", "<C-w>h", { desc = "Navigate to Left Window." })
set("n", "<C-j>", "<C-w>j", { desc = "Navigate Down a Window." })
set("n", "<C-k>", "<C-w>k", { desc = "Navigate Up a Window." })
set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Display signature helper." })
set("n", "<C-l>", "<C-w>l", { desc = "Navigate to Right Window." })

-- LuaSnip Jumpable
set({"i", "s"}, "<C-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true, desc = "Jump backward (snip)" })
set({"i", "s"}, "<C-l>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true, desc = "Jump forward (snip)" })

-- LuaSnip choice cycles
set({"i","s"}, "<C-n>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { silent = true, desc = "Cycle Choice forward (snip)"})
set({"i","s"}, "<C-p>", function()
	if ls.choice_active() then
		ls.change_choice(-1)
	end
end, { silent = true, desc = "Cycle Choice forward (snip)"})

--- Control + Alt +
set("n", "<C-A-h>", "<CMD>vertical resize -15<CR>", { desc = "Decrease vertical split size." })
set("n", "<C-A-j>", "<CMD>horizontal resize -1<CR>", { desc = "Decrease horizontal split size." })
set("n", "<C-A-k>", "<CMD>horizontal resize +1<CR>", { desc = "Increase horizontal split size." })
set("n", "<C-A-l>", "<CMD>vertical resize +15<CR>", { desc = "Increase vertical split size." })

--- Control + Shift +
set("n", "<C-S-L>", "<CMD>BufferLineMoveNext<CR>", { desc = "Move buffer right." })
set("n", "<C-S-h>", "<CMD>BufferLineMovePrev<CR>", { desc = "Move buffer left." })

--- Shift +
set("n", "<S-h>", "<CMD>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
set("n", "<S-l>", "<CMD>BufferLineCycleNext<CR>", { desc = "Next Buffer" })


--- LEADER KEYS ---
-- set("n", "<leader>a", "", { desc = "<leader>a" })

set("n", "<leader>b", "", { desc = "Buffer..." })
set("n", "<leader>bd", "<CMD>bp|bd#<CR>", { desc = "delete." })
set("n", "<leader>bo", "", { desc = "close others." })

set("n", "<leader>c", "", { desc = "Code.." })
set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "actions." })
set("n", "<leader>cc", "<CMD>CodeCopy<CR>", { desc = "Copy." })
set("n", "<leader>cu", "<CMD>CodeCopy open ui<CR>", { desc = "Open CC UI." })
set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "diagnostics." })

set("n", "<leader>d", "", { desc = "Debug..." })
set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Set Breakpoint." })
set("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Conditional Breakpoint." })
vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open Repl" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })

local filetree = require("mini.files")
set("n", "<leader>e", function()
	if not filetree.close() then filetree.open() end
end, { desc = "File Explorer" })

set("n", "<leader>f", "", { desc = "Find..." })
set("n", "<leader>fb", fzf.buffers, { desc = "Buffers." })
set("n", "<leader>fd", fzf.diagnostics_document, { desc = "Diagnostic." })
set("n", "<leader>ff", fzf.files, { desc = "Files." })
set("n", "<leader>fh", fzf.help_tags, { desc = "Help Tags." })
set("n", "<leader>fk", fzf.keymaps, { desc = "Keymaps." })
set("n", "<leader>fm", fzf.manpages, { desc = "Man Pages." })
set("n", "<leader>fr", fzf.lsp_references, { desc = "LSP References." })
set("n", "<leader>fs", fzf.lsp_document_symbols, { desc = "LSP Symbols." })

set("n", "<leader>g", "", { desc = "Git..." })
set("n", "<leader>gb", fzf.git_branches, { desc = "Branches." })
set("n", "<leader>gB", fzf.git_blame, { desc = "Blame." })
set("n", "<leader>gc", fzf.git_commits, { desc = "Commit logs." })
set("n", "<leader>gd", fzf.git_diff, { desc = "Diff." })
set("n", "<leader>gs", fzf.git_status, { desc = "Status." })
set("n", "<leader>gl", "<CMD>LazyGit<CR>", { desc = "LazyGit." })

-- set("n", "<leader>h", "", { desc = "<leader>h" })
-- set("n", "<leader>i", "", { desc = "<leader>i" })
-- set("n", "<leader>j", "", { desc = "<leader>j" })
-- set("n", "<leader>k", "", { desc = "<leader>k" })
-- set("n", "<leader>l", "", { desc = "<leader>l" })
-- set("n", "<leader>m", "", { desc = "<leader>m" })
-- set("n", "<leader>n", "", { desc = "<leader>n" })
-- set("n", "<leader>o", "", { desc = "<leader>o" })
-- set("n", "<leader>p", "", { desc = "<leader>p" })
-- set("n", "<leader>q", "", { desc = "<leader>q" })
-- set("n", "<leader>r", "", { desc = "<leader>r" })

set("n", "<leader>s", "", { desc = "Search..." })
set("n", "<leader>sb", fzf.lgrep_curbuf, { desc = "current Buffer" })
set("n", "<leader>sf", fzf.live_grep, { desc = "Files." })
set("n", "<leader>sw", fzf.grep_cword, { desc = "Word under cursor." })

-- set("n", "<leader>t", "", { desc = "<leader>t" })
-- set("n", "<leader>u", "", { desc = "<leader>u" })
-- set("n", "<leader>v", "", { desc = "<leader>v" })
-- set("n", "<leader>w", "", { desc = "<leader>w" })

set("n", "<leader>x", "", { desc = "Trouble..." })
set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (project)" })
set("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Diagnostics (buffer)" })
set("n", "<leader>xs", "<cmd>Trouble symbols toggle<cr>", { desc = "Symbols" })
set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix" })

-- set("n", "<leader>y", "", { desc = "<leader>y" })
-- set("n", "<leader>z", "", { desc = "<leader>z" })

