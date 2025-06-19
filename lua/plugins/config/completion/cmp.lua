---@diagnostic disable: unused-local
local cmp = require("cmp")
local cmp_mappings = require("plugins.config.completion.cmp_mappings")
local lspkind = require("lspkind")
cmp.setup({
	formatting = {
		format = function(entry, vim_item)
			vim_item = lspkind.cmp_format({
				mode = "symbol_text", -- shows icon + text (e.g., `ƒ Function`)
				maxwidth = 50,
				ellipsis_char = "_.._",
			})(entry, vim_item)

			local source_labels = {
				lazydev    = "Lazy",
				nvim_lsp   = "NORMAL",
				luasnip    = "Snip",
				buffer     = "Buff",
				path       = "Path",
				nvim_lua   = "Lua",
				emoji      = "Emoji",
				calc       = "Calc",
				treesitter = "TreeSit",
			}

			if entry.source.name == "nvim_lsp" and entry.source.source then
				local client = entry.source.source.client
				vim_item.menu = string.format("[LSP:%s]", client and client.name or "unknown")
			else
				local label = source_labels[entry.source.name] or entry.source.name
				vim_item.menu = string.format("[%s]", label)
			end

			return vim_item
		end,
		-- format = lspkind.cmp_format({
		-- 	mode = "symbol_text",
		-- 	maxwidth = {
		-- 		menu = 50,
		-- 		abbr = 50,
		-- 	},
		-- 	show_labelDetails = true,
		-- 	before = function(entry, vim_item)
		-- 		return vim_item
		-- 	end
		-- })
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			cmp.config.compare.kind,
			cmp.config.compare.order,
		},
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	completion = { completopt = "menu,menuone,preview" },
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert(cmp_mappings.normal),

	-- 🐂 This Ox is looking at you! You should be in fear ☠️ 
	sources = cmp.config.sources({
		{ name = "lazydev",    priority =   10 },
		{ name = "nvim_lsp",   priority =   20 },
		{ name = "supermaven", priority =  350 },
		{ name = "path",       priority =  600 },
		{ name = "luasnip",    priority =  700 },
		{ name = "nerdfont",   priority =  800 },
		{ name = "emoji",      priority =  900 },
		{ name = "copilot",    priority = 1000 },
	},{
		{ name = "buffer", priority = 500 },
	})
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(cmp_mappings.cmdline),
	sources = {
		{ name = 'buffer' },
	}
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(cmp_mappings.cmdline),
	sources = cmp.config.sources({
		{ name = "path" },
		{
			name = "cmdline",
			option = {
				ignore_cmd = { "Man", "!" },
			},
		},
	}),
	---@diagnostic disable-next-line: missing-fields
	matching = { disallow_symbol_nonprefix_matching = false },
})
