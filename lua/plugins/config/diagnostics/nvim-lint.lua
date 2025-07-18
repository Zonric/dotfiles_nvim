local lint = require("lint")
lint.linters_by_ft = {
	markdown = { "markdownlint" },
	json = { "jsonlint" },
	--clojure = { "clj-kondo" },
	--dockerfile = { "hadolint" },
	--inko = { "inko" },
	--janet = { "janet" },
	--json = { "jsonlint" },
	--markdown = { "vale" },
	--rst = { "vale" },
	--ruby = { "ruby" },
	--terraform = { "tflint" },
	--text = { "vale" }
}
-- You can disable the default linters by setting their filetypes to nil:
-- lint.linters_by_ft['clojure'] = nil
local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	group = lint_augroup,
	callback = function()
		if vim.bo.modifiable then
			lint.try_lint()
		end
	end,
})
