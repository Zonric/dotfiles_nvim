local set = vim.keymap.set
local builtin = require("telescope.builtin")
--set( "n", "", "", { desc = "" })

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

set( "n", "<leader>f", "", { desc = "Find..." })
set( "n", "<leader>ff", builtin.find_files, { desc = "Files with Telescope." })
set( "n", "<leader>fg", builtin.live_grep, { desc = "Files with Grep in Telescope." })

-- Git
set( "n", "<leader>g", "", { desc = "Git..." })
set( "n", "<leader>gb", "<cmd>GitBlameToggle<cr>", { desc = "Toggle Git Blame View." })
set( "n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Git diff." })
set( "n", "<leader>ge", "<cmd>DiffviewClose<cr>", { desc = "Git diff Exit."})
set( "n", "<leader>gg", "<cmd>DiffviewFileHistory<cr>", { desc = "Git [G]it History."})
set( "n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "Git File [H]istory."})

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
set( "i", "<C-n>", '<cmd>lua require("cmp").select_next_item()<cr>', { desc = "Index [n]ext." })
set( "i", "<C-p>", '<cmd>lua require("cmp").select_prev_item()<cr>', { desc = "Index [p]revious." })
set( "i", "<C-Space>", '<cmd>lua require("cmp").complete()<cr>', { desc = "Show completion." })
set( "i", "<C-e>", '<cmd>lua require("cmp").abort()<cr>', { desc = "Abort Selection" })
set( "i", "<C-y>", '<cmd>lua require("cmp").confirm({ select = 1 })<cr>', { desc = "Select completion." })
