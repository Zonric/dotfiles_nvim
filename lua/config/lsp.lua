vim.o.winborder = "rounded"

require("luasnip").filetype_extend("cpp", { "c" })
require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })
