local cmp = require("cmp")
local M = {}

--- Confirm explicitly selected item in completion menu if visible, otherwise call fallback function
function M.confirm_selected(fallback)
	if cmp.visible() and cmp.get_selected_entry() then
		cmp.confirm({ select = false })
	else
		fallback()
	end
end

--- Confirm first/select item in completion menu if visible, otherwise call fallback function
function M.confirm_first(fallback)
	if cmp.visible() then
		cmp.confirm({ select = true })
	else
		fallback()
	end
end

--- Select next item in completion menu if visible, otherwise call fallback function
function M.selection_next(fallback)
	if cmp.visible() then
		cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	else
		fallback()
	end
end

--- Select previous item in completion menu if visible, otherwise call fallback function
function M.selection_prev(fallback)
	if cmp.visible() then
		cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
	else
		fallback()
	end
end

--- Abort completion menu if visible, otherwise call fallback function
function M.abort(fallback)
	if cmp.visible() then
		cmp.abort()
	else
		fallback()
	end
end

--- Toggle completion menu
function M.toggle_cmp()
	if cmp.visible() then
		cmp.abort()
	else
		cmp.complete()
	end
end

--- Key mappings for cmp in normal modes:
M.normal = {
	["<C-e>"] = M.toggle_cmp,
	["<C-n>"] = M.selection_next,
	["<C-p>"] = M.selection_prev,
	["<C-y>"] = M.confirm_first,
	["<CR>"]  = M.confirm_selected_or_newline,
}

--- Key mapping for cmp in commandline modes:
M.cmdline = {
	["<C-e>"] = cmp.mapping(M.toggle_cmp(), { "c" }),
	["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c" }),
	["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c" }),
	["<C-y>"] = cmp.mapping(M.confirm_first, { "c" }),
	["<CR>"]  = cmp.mapping(M.confirm_selected, { "c" }),
}

return M
