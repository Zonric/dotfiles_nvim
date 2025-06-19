local M = {}

function M.create(name)
	return vim.api.nvim_create_augroup("zonric_" .. name, { clear = true })
end

return M
