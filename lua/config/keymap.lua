local set = vim.keymap.set
local builtin = require("telescope.builtin")
--set( "n", "", "", { desc = "" })

--
-- Navigation
--
set( "n", "<C-h>", "<C-w>h", { desc = "Navigate to Left Pane." })
set( "n", "<C-j>", "<C-w>j", { desc = "Navigate Down a Pane." })
set( "n", "<C-k>", "<C-w>k", { desc = "Navigate Up a Pane." })
set( "n", "<C-l>", "<C-w>l", { desc = "Navigate to Right Pane." })

--
-- Code
-- 
set( "n", "<leader>c", "", { desc = "Code..." })
set( "n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Actions." })
set( "n", "<leader>ce", vim.diagnostic.open_float, { desc = "Error messages." })

--
-- Explorer
--
set( "n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Open File Explorer" })

set( "n", "<leader>f", "", { desc = "Find..." })
set( "n", "<leader>ff", builtin.find_files, { desc = "Find Files with Telescope." })
set( "n", "<leader>fg", builtin.live_grep, { desc = "Grep Files with Telescope." })

--
-- Git
--
set( "n", "<leader>g", "", { desc = "Git..." })
set( "n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Git diff." })
set( "n", "<leader>ge", "<cmd>DiffviewClose<CR>", { desc = "Git diff Exit."})
set( "n", "<leader>gg", "<cmd>DiffviewFileHistory<CR>", { desc = "Git [G]it History."})
set( "n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Git File [H]istory."})

--
-- Split Pane
--
set( "n", "<leader>s", "", { desc = "Split Pane..." })
set( "n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertically." })
set( "n", "<leader>sh", "<cmd>split<CR>", { desc = "Horizantally." })

--
-- Completion
--
set( "i", "<C-n>", '<cmd>lua require("cmp").select_next_item()<CR>', { desc = "Index [n]ext." })
set( "i", "<C-p>", '<cmd>lua require("cmp").select_prev_item()<CR>', { desc = "Index [p]revious." })
set( "i", "<C-Space>", '<cmd>lua require("cmp").complete()<CR>', { desc = "Show completion." })
set( "i", "<C-e>", '<cmd>lua require("cmp").abort()<CR>', { desc = "Abort Selection" })
set( "i", "<C-y>", '<cmd>lua require("cmp").confirm({ select = 1 })<CR>', { desc = "Select completion." })
