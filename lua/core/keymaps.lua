local set = vim.keymap.set
-- local cmp = require("cmp")
local dap = require("dap")
local dapui = require("dapui")
local gitsigns = require("gitsigns")
local telescope = require("telescope.builtin")
local ls = require("luasnip")

-- set("n", "", "", { desc = "" })

-- Fixed up and down
set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })
set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })
set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })
set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })

-- Comments
set("n", "gcO", "O<esc>Vc#<esc><cmd>normal gcc<cr>f#a<bs>", { desc = "Insert Comment Line Above." })
set("n", "gco", "o<esc>Vc#<esc><cmd>normal gcc<cr>f#a<bs>", { desc = "Insert Comment Line Below." })

-- LSP, Diagnostics, & Quickfix
set("n", "K", vim.lsp.buf.hover, { desc = "Display current symbol info." })
set("n", "gD", vim.lsp.buf.declaration, { desc = "goto declaration." })
set("n", "gO", telescope.lsp_document_symbols, { desc = "Open document symbols." })
set("n", "gW", telescope.lsp_dynamic_workspace_symbols, { desc = "Open workspace symbols." })
set("n", "gd", vim.lsp.buf.definition, { desc = "goto definition." })
set("n", "gi", vim.lsp.buf.implementation, { desc = "goto implementation." })
set("n", "gr", vim.lsp.buf.references, { desc = "goto references." })
set("n", "gt", telescope.lsp_type_definitions, { desc = "goto Type Definintion." })

set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix." })
set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix." })
set("n", "]c", function()
	if vim.wo.diff then
		vim.cmd.normal { "]c", bang = true }
	else
		gitsigns.nav_hunk "next"
	end
end, { desc = "Jump to next git [c]hange" })
set("n", "[c", function()
	if vim.wo.diff then
		vim.cmd.normal { "[c", bang = true }
	else
		gitsigns.nav_hunk "prev"
	end
end, { desc = "Jump to previous git [c]hange" })

set("n", "<leader>/", function()
	telescope.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = "Fuzzy search current buffer." })

-- TreeSitter
set("n", "<leader>t", "", { desc = "Toggle..." })
set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Current line blame." })
set("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Word diff." })

-- Buffer
set("n", "<leader>b", "", { desc = "Buffer..." })
set("n", "<leader>bd", function()
	require("bufdelete").bufdelete(0)
end, { desc = "Delete" })

-- Code
set("n", "<leader>c", "", { desc = "Code..." })
set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions." })
set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Error messages." })
set("n", "<leader>cf", function()
	require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "Format buffer." })
set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename." })

-- Debugger
set("n", "<leader>d", "", { desc = "Debugger..." })
set("n", "<leader>dd", function()
	dap.continue()
end, { desc = "Debug (Start/Continue)" })
set("n", "<leader>db", function()
	dap.toggle_breakpoint()
end, { desc = "Breakpoint." })
set("n", "<leader>dB", function()
	dap.toggle_breakpoint(vim.fn.input "Breakpoiint condition: ")
end, { desc = "Breakpoint conditional." })
set("n", "<leader>ds", function()
	dap.step_into()
end, { desc = "Step into." })
set("n", "<leader>do", function()
	dap.step_over()
end, { desc = "Step over." })
set("n", "<leader>dO", function()
	dap.step_out()
end, { desc = "Step out." })
set("n", "<leader>du", function()
	dapui.toggle()
end, { desc = "Session results." })

-- Explorer
---@diagnostic disable-next-line: undefined-global
set("n", "<leader>e", MiniFiles.open, { desc = "Open File Explorer." })
set("n", "\\", "<cmd>Neotree toggle<cr>", { desc = "Open File Explorer." })

set("n", "<leader>f", "", { desc = "Find...(Telescope)" })
set("n", "<leader>f/", function()
	telescope.live_grep {
		grep_open_files = true,
		prompt_title = "via Grep in open buffers.",
	}
end, { desc = "Grep Files." })
set("n", "<leader>fb", "<CMD>Telescope buffers<CR>", { desc = "Buffers." })
set("n", "<leader>fc", function()
	telescope.find_files { cwd = vim.fn.stdpath "config" }
end, { desc = "Config Files." })
set("n", "<leader>fd", "<CMD>Telescope diagnostics<CR>", { desc = "Config Files." })
set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = "Files." })
set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = "Grep Files." })
set("n", "<leader>fh", "<CMD>Telescope help_tags<CR>", { desc = "Help." })
set("n", "<leader>fr", "<CMD>Telescope oldfiles<CR>", { desc = "Recent Files." })
set("n", "<leader>fw", "<CMD>Telescope grep_string<CR>", { desc = "Grep visual selection or word." })
set("n", "<leader>fk", "<CMD>Telescope keymaps<CR>", { desc = "keybind." })
set("n", "<leader>fq", "<CMD>Telescope quickfix<CR>", { desc = "QuickFix." })
set("n", "<leader>fn", "<CMD>Telescope notify<CR>", { desc = "QuickFix." })
set("n", "<leader>ft", "<CMD>Telescope builtin<CR>", { desc = "Telescope Picker." })

-- set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help with Grep in Telescope." })
-- set("n", "<leader>fp", function() tsbi.find_files({ cwd = require("lazy.core.config").options.root }) end, { desc = "Files Plugin Files." })

-- Git
set("n", "<leader>g", "", { desc = "Git..." })
-- visual mode
set("v", "<leader>gs", function()
	gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "git stage hunk" })
set("v", "<leader>gr", function()
	gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "git reset hunk" })
-- normal mode
set("n", "<leader>gb", "", { desc = "Git blame..." })
set("n", "<leader>gbt", gitsigns.toggle_current_line_blame, { desc = "Toggle git show blame line" })
set("n", "<leader>gbl", gitsigns.blame_line, { desc = "git blame line" })
set("n", "<leader>gd", gitsigns.diffthis, { desc = "git diff against index" })
set("n", "<leader>gD", function()
	gitsigns.diffthis "@"
end, { desc = "git Diff against last commit" })
set("n", "<leader>gl", "<CMD>LazyGit<CR>", { desc = "Git LAZY" })
set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "git preview hunk" })
set("n", "<leader>gP", gitsigns.preview_hunk_inline, { desc = "Toggle git show Deleted" })
set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "git reset hunk" })
set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "git Reset buffer" })
set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "git stage hunk" })
set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "git Stage buffer" })
set("n", "<leader>gu", gitsigns.stage_hunk, { desc = "git undo stage hunk" })
-- Toggles

-- Markdown
set("n", "<leader>m", "", { desc = "Markdown..." })
set("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "Render (toggle)." })
set("n", "<leader>mp", "<cmd>PeekToggle<cr>", { desc = "Toggle Peek." })

-- Split 
set("n", "<leader>s", "", { desc = "Split ..." })
set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Window Vertically." })
set("n", "<leader>sh", "<cmd>split<cr>", { desc = "Window Horizantally." })
set("n", "<leader>ss", function()
	require("mini.splitjoin").toggle()
end, { desc = "Structure." })

set("n", "<leader>q", "", { desc = "Quit..." })
set("n", "<leader>qq", "<cmd>q<cr>", { desc = "Quit." })
set("n", "<leader>qw", "<cmd>w<cr><cmd>q<cr>", { desc = "Write and Quit." })
set("n", "<leader>qp", "<cmd>q!<cr>", { desc = "Force Quit." })

-- Quickfix
set("n", "<leader>x", "", { desc = "Trouble..." })
set("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / References / ..." })
set("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble Location List" })
set("n", "<leader>xq", "<cmd>Trouble qflist<cr>", { desc = "Toggle Trouble Quickfix List." })
set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle Trouble Buffer Diagnostics." })
set("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble Diagnostics." })

-- Move Lines
set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Line Down" })
set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Line Up" })
set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Line Down" })
set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Line Up" })
set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Line Down" })
set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Line Up" })
set("v", ">", ">gv", { desc = "Increase Indentation." })
set("v", "<", "<gv", { desc = "Decrease Indentation." })

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
-- set("i", "<C-e>", function() cmp.abort() end, { desc = "Abort Selection" })
-- set("i", "<C-n>", function() cmp.select_next_item() end, { desc = "Index [n]ext." })
-- set("i", "<C-p>", function() cmp.select_prev_item() end, { desc = "Index [p]revious." })
-- set("i", "<C-y>", function() cmp.confirm({ select = 1 }) end, { desc = "Select completion." })
-- set("i", "<C-Space>", function() cmp.complete() end, { desc = "Show completion." })

-- LuaSnip
set({ "i", "s" }, "<C-K>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { desc = "Jump to next item in snippet." })

set({ "i", "s" }, "<C-J>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { desc = "Jump backwards in the snippet." })

set("i", "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { desc = "Change active choice." })

