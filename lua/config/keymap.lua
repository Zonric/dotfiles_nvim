local set = vim.keymap.set

-- Navigation
set( "n", "<C-h>", "<C-w>h", { desc = "Navigate to Left Pane." })
set( "n", "<C-j>", "<C-w>j", { desc = "Navigate Down a Pane." })
set( "n", "<C-k>", "<C-w>k", { desc = "Navigate Up a Pane." })
set( "n", "<C-l>", "<C-w>l", { desc = "Navigate to Right Pane." })

-- Code
set( "n", "<leader>c", "", { desc = "Code..." })
set( "n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions." })
set( "n", "<leader>ce", vim.diagnostic.open_float, { desc = "Error messages." })

-- Explorer
set( "n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Open File Explorer." })

local builtin = require("telescope.builtin")
set( "n", "<leader>f", "", { desc = "Find..." })
set( "n", "<leader>ff", builtin.find_files, { desc = "Files with Telescope." })
set( "n", "<leader>fg", builtin.live_grep, { desc = "Files with Grep in Telescope." })

-- Git
set( "n", "<leader>g", "", { desc = "Git..." })
set( "n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame View." })
set( "n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Toggle Git Blame View." })

-- Split Pane
set( "n", "<leader>s", "", { desc = "Split Pane..." })
set( "n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Vertically." })
set( "n", "<leader>sh", "<cmd>split<cr>", { desc = "Horizantally." })

-- Quickfix
set( "n", "<leader>x", "", { desc = "Trouble..." })
set( "n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / References / ..." })
set( "n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble Location List" } )
set( "n", "<leader>xq", "<cmd>Trouble qflist<cr>", { desc = "Toggle Trouble Quickfix List." })
set( "n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Toggle Trouble Buffer Diagnostics." })
set( "n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Toggle Trouble Diagnostics." })

-- Completion
local cmp = require("cmp")
set( "i", "<C-e>", function() cmp.abort() end, { desc = "Abort Selection" })
set( "i", "<C-n>", function() cmp.select_next_item() end, { desc = "Index [n]ext." })
set( "i", "<C-p>", function() cmp.select_prev_item() end, { desc = "Index [p]revious." })
set( "i", "<C-y>", function() cmp.confirm({ select = 1 }) end, { desc = "Select completion." })
set( "i", "<C-Space>", function() cmp.complete() end, { desc = "Show completion." })

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

