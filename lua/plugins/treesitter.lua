return {
	{
		"jwalton512/vim-blade",
		enabled = true,
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		enabled = true,
		lazy = false,
		dependencies = {
			{ "nvim-treesitter/nvim-treesitter-textobjects" },
		},
		opts = {
			ensure_installed = "all",
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		},
		config = function(_, opts)
			---@class ParserInfo[]
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = {
						"src/parser.c",
						-- 'src/scanner.cc',
					},
					branch = "main",
					generate_requires_npm = true,
					requires_generate_from_grammar = true,
				},
				filetype = "blade",
			}
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
