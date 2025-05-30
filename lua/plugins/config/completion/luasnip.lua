---@diagnostic disable: unused-local

local ls = require("luasnip")
ls.config.setup {
	require("luasnip.loaders.from_vscode").lazy_load()
}

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets("html", {
	s({"html","blade"}, {
		t("Static Text"),
		t({ "", "function "}),
		i(1),
		t("("),
		i(2, "int foo"),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
})

