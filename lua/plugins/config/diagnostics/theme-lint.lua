vim.api.nvim_create_user_command("ThemeLint", function()
	require("theme-lint").lint(true, 0)
end, {})

-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = {"*/.config/theme/*.theme", "*/.config/theme/active"},
-- 	callback = function()
-- 		require("theme-lint").format()
-- 	end,
-- })

require("theme-lint").setup({
	diagnostics = true,
})
