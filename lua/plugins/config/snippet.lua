---@diagnostic disable: undefined-field
local ls = require("luasnip")
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
		f(copy, 2),
		t({ "", "function "}),
		i(1),
		t("("),
		i(2, "int foo"),
		t({ ") {", "\t" }),
		i(0),
		t({ "", "}" }),
	}),
})
