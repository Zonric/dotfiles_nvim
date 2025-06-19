local set = vim.keymap.set
local dap = require("dap")
local dapui = require("dapui")
local gitsigns = require("gitsigns")
local telescope = require("telescope.builtin")
local telescope_ext = require("telescope").load_extension("emoji")
local luasnip = require("luasnip")
local minifiles = require("mini.files")

local home_dir = vim.fn.expand("$HOME")
local cfg_dir = vim.fn.stdpath("config")

set("n", "<F12>", "<CMD>Lazy reload codecopy_dev<CR>", { desc = "Reload CodeCopy" })

-- Move aound Lines
-- Fixed up and down .... 7 6 11 5 9 MOVING UP AND DOWN AGAIN.
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })
set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })
set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })

-- Comments
set("n", "gcO", "O<esc>Vc#<esc><cmd>normal gcc<cr>f#a<bs>", { desc = "Insert Comment Line Above." })
set("n", "gco", "o<esc>Vc#<esc><cmd>normal gcc<cr>f#a<bs>", { desc = "Insert Comment Line Below." })

-- LSP, Diagnostics, Quickfix, & Signature Help
-- <C-s> is used for toggle_key in lsp_signature, see [plugins.config.lsp.lsp_signature.lua]
set("n", "K", vim.lsp.buf.hover, { desc = "Display current symbol info." })
set("n", "gD", vim.lsp.buf.declaration, { desc = "goto declaration." })

set("n", "gO", telescope.lsp_document_symbols, { desc = "get document symbols." })
set("n", "gW", telescope.lsp_dynamic_workspace_symbols, { desc = "get Workspace symbols." })
set("n", "gd", vim.lsp.buf.definition, { desc = "goto definition." })
set("n", "gi", vim.lsp.buf.implementation, { desc = "goto implementation." })
set("n", "gr", vim.lsp.buf.references, { desc = "goto references." })
set("n", "gt", telescope.lsp_type_definitions, { desc = "goto Type Definintion." })
set("n", "gh", function()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local buf = vim.api.nvim_win_get_buf(win)
		if vim.bo[buf].filetype == "help" then
			vim.api.nvim_set_current_win(win)
			return
		end
	end
	vim.notify("No help windows found.", vim.log.levels.WARN)
end, { desc = "goto to help window." })

set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix." })
set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix." })
set("n", "]c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gitsigns.nav_hunk("next")
	end
end, { desc = "Jump to next git [c]hange" })
set("n", "[c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		gitsigns.nav_hunk("prev")
	end
end, { desc = "Jump to previous git [c]hange" })

set("n", "<leader>/", function()
	telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "Fuzzy search current buffer." })

-- TreeSitter
set("n", "<leader>t", "", { desc = "Toggle..." })
set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Current line blame." })
set("n", "<leader>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }))
end, { desc = "inlay Hints" })
set("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Word diff." })

-- Code
set("n", "<leader>c", "", { desc = "Code..." })
set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions." })
set("v", "<leader>cc", "<CMD>CodeCopy<CR>", { desc = "CodeCopy md format." })
set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Error messages." })
set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename." })
set("n", "<leader>cl", "<CMD>ThemeLint<CR>", { desc = "Lint theme." })
set("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_format = "fallback" })
end, { desc = "Format buffer." })
-- Code: CodeCopy
set({ "n", "v" }, "<leader>cd", function()
	require("codecopy.config").toggle_debug()
end, { desc = "toggle CodeCopy debug." })
set({ "n", "v" }, "<leader>cn", function()
	require("codecopy.config").toggle_notify()
end, { desc = "Toggle CodeCopy notify." })
set({ "n", "v" }, "<leader>cg", function()
	require("codecopy.config").toggle_code_fence()
end, { desc = "Toggle CodeCopy fencing." })
set({ "n", "v" }, "<leader>cp", function()
	require("codecopy.config").toggle_include_file_path()
end, { desc = "Toggle CodeCopy include file path." })
set("n", "<leader>cu", function()
	require("codecopy.ui").open()
end, { desc = "Open codecopy ui" })

--
-- Debugger
--

-- Eval var under cursor
set("n", "<leader>?", function()
	---@diagnostic disable-next-line: missing-fields
	require("dapui").eval(nil, { enter = true })
end)

set("n", "<F1>", dap.continue, { desc = "Continue" })
set("n", "<F2>", dap.step_into, { desc = "Step into" })
set("n", "<F3>", dap.step_over, { desc = "Step over" })
set("n", "<F4>", dap.step_out, { desc = "Step out" })
set("n", "<F5>", dap.step_back, { desc = "Step back" })
set("n", "<F8>", dap.restart, { desc = "Restart debugger" })

set("n", "<leader>d", "", { desc = "Debugger..." })
set("n", "<leader>dc", function()
	dap.run_to_cursor()
end, { desc = "Run to cursor." })
set("n", "<leader>dd", function()
	dap.continue()
end, { desc = "Debug (Start/Continue)" })
set("n", "<leader>ds", function()
	dap.step_into()
end, { desc = "Step into." })
set("n", "<leader>dl", function()
	require("osv").launch({ port = 8086 })
end, { desc = "Debugger Lua" })
set("n", "<leader>do", function()
	dap.step_over()
end, { desc = "Step over." })
set("n", "<leader>dO", function()
	dap.step_out()
end, { desc = "Step out." })
set("n", "<leader>dp", function()
	dap.toggle_breakpoint()
end, { desc = "Breakpoint." })
set("n", "<leader>dP", function()
	dap.toggle_breakpoint(vim.fn.input("Breakpoiint condition: "))
end, { desc = "Breakpoint conditional." })
set("n", "<leader>du", function()
	dapui.toggle()
end, { desc = "Session results." })
set("n", "<leader>dv", "<CMD>DapVirtualTextToggle<CR>", { desc = "Toggle Debug virtual text" })

-- Explorer
set("n", "<leader>e", function()
	if not minifiles.close() then
		return minifiles.open()
	end
end, { desc = "Toggle MiniFiles in current working directory." })
-- Also see: <leader>m Misc for more minifile keymaps
set("n", "\\", "<cmd>Neotree toggle<cr>", { desc = "Open File Explorer." })
set("n", "<C-\\>", function()
	require("utils.cycle_split").cycle()
end, { desc = "Cycle split width ratios" })

-- Find
set("n", "<leader>f", "", { desc = "Find...(Telescope)" })
set("n", "<leader>f/", function()
	telescope.live_grep({
		grep_open_files = true,
		prompt_title = "via Grep in open buffers.",
	})
end, { desc = "Grep Files." })
set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Buffers." })
set("n", "<leader>fc", function()
	telescope.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Config Files." })
set("n", "<leader>fd", "<CMD>Telescope diagnostics<CR>", { desc = "Config Files." })
set("n", "<leader>fe", telescope_ext.emoji, { desc = "Emojis 🫶." })
set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Files." })
set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Grep Files." })
set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Help." })
set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Recent Files." })
set("n", "<leader>fw", "<CMD>Telescope grep_string<CR>", { desc = "Grep visual selection or word." })
set("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", { desc = "keybind." })
set("n", "<leader>fq", "<CMD>Telescope quickfix<CR>", { desc = "QuickFix." })
set("n", "<leader>fn", "<CMD>Telescope notify<CR>", { desc = "QuickFix." })
set("n", "<leader>ft", "<CMD>Telescope builtin<CR>", { desc = "Telescope Picker." })

-- Git
set("n", "<leader>g", "", { desc = "Git..." })

-- visual mode
set("v", "<leader>gs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "git stage hunk" })
set("v", "<leader>gr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "git reset hunk" })

-- normal mode
set("n", "<leader>gb", "", { desc = "Git blame..." })
set("n", "<leader>gbt", gitsigns.toggle_current_line_blame, { desc = "Toggle git show blame line" })
set("n", "<leader>gbl", gitsigns.blame_line, { desc = "git blame line" })
set("n", "<leader>gd", gitsigns.diffthis, { desc = "git diff against index" })
set("n", "<leader>gD", function()
	gitsigns.diffthis("@")
end, { desc = "git Diff against last commit" })
set("n", "<leader>gl", "<CMD>LazyGit<CR>", { desc = "Git LAZY" })
set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "git preview hunk" })
set("n", "<leader>gP", gitsigns.preview_hunk_inline, { desc = "Toggle git show Deleted" })
set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "git reset hunk" })
set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "git Reset buffer" })
set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "git stage hunk" })
set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "git Stage buffer" })
set("n", "<leader>gu", gitsigns.stage_hunk, { desc = "git undo stage hunk" })

-- Markdown
set("n", "<leader>m", "", { desc = "Misc..." })
set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Markdown Render (toggle)." })
set("n", "<leader>mp", "<cmd>PeekToggle<cr>", { desc = "Markdown toggle Peek." })
set("n", "<leader>mc", function()
	minifiles.open(cfg_dir)
end, { desc = "MiniFiles open Config." })
set("n", "<leader>mh", function()
	minifiles.open(home_dir)
end, { desc = "MiniFiles open Config." })

-- Split
set("n", "<leader>s", "", { desc = "Split ..." })
set("n", "<leader>sc", "<cmd>close<cr>", { desc = "Close." })
set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Window Vertically." })
set("n", "<leader>sh", "<cmd>split<cr>", { desc = "Window Horizantally." })
set("n", "<leader>ss", function()
	require("mini.splitjoin").toggle()
end, { desc = "Structure." })
set("x", "g=", function()
	local mini_align = require("mini.align")
	mini_align.align({
		pattern = { "=", "==" },
		action = "align",
	})
end, { desc = "Align by = (padded on lhs)" })

---------------------------------------------------
---                Replace                      ---
---------------------------------------------------
set("n", "<leader>r", "", { desc = "Replace..." })

set("n", "<leader>rs", function()
	require("spectre").toggle()
end, { desc = "via spectre." })

set("n", "<leader>rW", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "current word. (spectre)" })
set("v", "<leader>rW", function()
	require("spectre").open_visual()
end, { desc = "current word. (spectre)" })

set("n", "<leader>rw", function()
	require("spectre").open_file_search({ select_word = true })
end, { desc = "on current file. (spectre)" })
set("v", "<leader>rw", function()
	require("spectre").open_file_search()
end, { desc = "on current file. (spectre)" })

---------------------------------------------------
---                  Quit                       ---
---------------------------------------------------
set("n", "<leader>q", "", { desc = "Quit..." })
set("n", "<leader>qb", "<CMD>bp|bd #<CR>", { desc = "Buffer.     🤕" })
set("n", "<leader>qf", "<cmd>q!<cr>", { desc = "with Force. 😰" })
set("n", "<leader>qw", "<cmd>w|q<cr>", { desc = "and write.  🥰" })
set("n", "<leader>qq", "<cmd>q<cr>", { desc = "Nvim.       😞" })

-- Quickfix
set("n", "<leader>x", "", { desc = "Trouble..." })
set("n", "<leader>xl", function()
	if vim.tbl_isempty(vim.diagnostic.get()) then
		vim.notify("No diagnostics to list.", vim.log.levels.INFO, { title = "Diagnostics Quickfix" })
	else
		vim.diagnostic.setqflist()
		vim.cmd("copen")
	end
end, { desc = "Diagnostics Quickfix" })
-- set("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / References / ..." })
set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble location list" })
set("n", "<leader>xq", "<cmd>Trouble qflist<cr>", { desc = "Toggle trouble quickfix list." })
set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle trouble buffer diagnostics." })
set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle trouble diagnostics." })

-- Move Lines
set("n", "<A-h>", "<h", { desc = "Decrease indentation on line." })
set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move line down" })
set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move line up" })
set("n", "<A-l>", ">l", { desc = "Increase indentation on line." })

set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })

set("v", "<A-h>", "<gv", { desc = "Decrease indentation on line." })
set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move line down" })
set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move line up" })
set("v", "<A-l>", ">gv", { desc = "Increase indentation on line." })

-- Terminal
set({ "n", "i" }, "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal." })

-- Navigation
set("n", "<C-h>", "<C-w>h", { desc = "Navigate to Left Window." })
set("n", "<C-j>", "<C-w>j", { desc = "Navigate Down a Window." })
set("n", "<C-k>", "<C-w>k", { desc = "Navigate Up a Window." })
set("n", "<C-l>", "<C-w>l", { desc = "Navigate to Right Window." })
set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Completion
-- see "plugins.config.completion.cmp_mappings"
-- LuaSnip
set({ "i", "s" }, "<Tab>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", true)
	end
end, { desc = "Jump to next item in snippet." })

set({ "i", "s" }, "<S-Tab>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<S-Tab>", true, false, true), "n", true)
	end
end, { desc = "Jump backwards in the snippet." })

set("i", "<C-E>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end, { desc = "Change active choice." })
