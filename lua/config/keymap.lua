local set = vim.keymap.set

-- Comments
set("n", "gcO", "O<esc>Vc#<esc><cmd>normal gcc<cr>f#a<bs>", { desc = "Insert Comment Line Above." })
set("n", "gco", "o<esc>Vc#<esc><cmd>normal gcc<cr>f#a<bs>", { desc = "Insert Comment Line Below." })

-- LSP, Diagnostics, & Quickfix
set("n", "K", vim.lsp.buf.hover, { desc = "Display current symbol info." })
set("n", "gd", vim.lsp.buf.definition, { desc = "goto Definition." })
set("n", "gD", vim.lsp.buf.declaration, { desc = "goto Declaration." })
set("n", "gi", vim.lsp.buf.implementation, { desc = "goto implementation." })
set("n", "gr", vim.lsp.buf.references, { desc = "goto references." })

set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix." })
set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix." })

-- Buffer
set("n", "<leader>b", "", { desc = "Buffer..." })
set("n", "<leader>bd", function() require("bufdelete").bufdelete(0) end, { desc = "Delete" })

-- Code
set("n", "<leader>c", "", { desc = "Code..." })
set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions." })
set("n", "<leader>ce", vim.diagnostic.open_float, { desc = "Error messages." })
set("n", "<leader>cf", vim.lsp.buf.format, { desc = "Format." })
set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename." })

-- Explorer
set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Open File Explorer." })

local tsbi = require("telescope.builtin")
set("n", "<leader>f", "", { desc = "Find..." })
set("n", "<leader>ff", tsbi.find_files, { desc = "Files with Telescope." })
set("n", "<leader>fg", tsbi.live_grep, { desc = "Files with Grep in Telescope." })
set("n", "<leader>fp", function() tsbi.find_files({ cwd = require("lazy.core.config").options.root }) end, { desc = "Files Plugin Files." })
set("n", "<leader>fc", function() tsbi.find_files({ cwd = "~/.config/nvim/lua/" }) end, { desc = "Find nvimConfig Files" })

-- Git
set("n", "<leader>g", "", { desc = "Git..." })
set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame View." })
set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Toggle Git Blame View." })

-- Split Window
set("n", "<leader>s", "", { desc = "Split Window..." })
set("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertically." })
set("n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizantally." })

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

-- Navigation
set("n", "<C-h>", "<C-w>h", { desc = "Navigate to Left Window." })
set("n", "<C-j>", "<C-w>j", { desc = "Navigate Down a Window." })
set("n", "<C-k>", "<C-w>k", { desc = "Navigate Up a Window." })
set("n", "<C-l>", "<C-w>l", { desc = "Navigate to Right Window." })
set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- Completion
local cmp = require("cmp")
set("i", "<C-e>", function() cmp.abort() end, { desc = "Abort Selection" })
set("i", "<C-n>", function() cmp.select_next_item() end, { desc = "Index [n]ext." })
set("i", "<C-p>", function() cmp.select_prev_item() end, { desc = "Index [p]revious." })
set("i", "<C-y>", function() cmp.confirm({ select = 1 }) end, { desc = "Select completion." })
set("i", "<C-Space>", function() cmp.complete() end, { desc = "Show completion." })

-- LuaSnip
local ls = require("luasnip")
set({"i", "s"}, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { desc = "Jump to next item in snippet." })

set({"i", "s"}, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { desc = "Jump backwards in the snippet." })

set("i", "<C-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { desc = "" })

-- 
